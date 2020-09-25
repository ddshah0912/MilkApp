import 'package:customer/models/item.dart';
import 'package:customer/models/order.dart';
import 'package:customer/models/user.dart';
import 'package:customer/services/database/subscribedatabase.dart';
import 'package:customer/services/database/userdatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:table_calendar/table_calendar.dart';
import 'package:customer/services/database/itemdatabase.dart';
import 'package:intl/intl.dart';
import 'package:customer/services/auth.dart';
import 'dart:async';

class Subscribe extends StatefulWidget {
  final Item item;
  Subscribe({this.item});

  @override
  SubscribePage createState() => SubscribePage(item: item);
}

class SubscribePage extends State<Subscribe> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 0));

  final Item item;
  SubscribePage({this.item});
  int _n = 1;
  String uid;

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: new DateTime(DateTime.now().year + 50),
    );

    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MilkInWay'),
        centerTitle: true,
      ),
      //print(item.id),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          Text('\n${item.name}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          Text('\nDescription\n',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          Text(
              'Farm fresh & pure cow milk from our own state of the art. Dairy farms where we ensure cow comfort, hygiene, health and high quality feed grown by using own cow manure. This milk go through several testing and quality check which ensures purest milk quality.'),
          Text('\nProducedBy    :  MilkInWay'),
          Text('Price           :  ${item.price}\n'),
          const Divider(
              color: Colors.black,
              height: 10,
              thickness: 2,
              indent: 0,
              endIndent: 0),
          Text('\nChoose Delivery: ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    await displayDateRangePicker(context);
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SelectDate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "Start Date: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}"),
              Text(
                  "End Date: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}"),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                      heroTag: "minusButton",
                      onPressed: minus,
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                    new Text('$_n', style: new TextStyle(fontSize: 30.0)),
                    new FloatingActionButton(
                      heroTag: "addButton",
                      onPressed: add,
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    bool avilable =
                        await ItemDatabase().isItemAvailable(item.id);
                    if (avilable == true) {
                      uid = await getUserId();
                      Navigator.of(context).pop();
                      await OrderDatabase().updateOrderData(
                          uid, item.name,item.price, _startDate, _endDate, _n);
                    } else {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Not Available'),
                              content: Text(
                                  'Sorry, Item is deleted or doesn\'t exist'),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text('Ok'),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void add() {
    setState(() {
      if (_n != 20) _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  Future<String> getUserId() async {
    final FirebaseUser user = await auth.currentUser();
    uid = user.uid;
    return uid;
  }
}
