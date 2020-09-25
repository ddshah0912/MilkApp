import 'package:customer/models/order.dart';
import 'package:customer/services/database/subscribedatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  DateTime selectedDate;
  ViewOrder({this.selectedDate});

  @override
  ViewOrderPage createState() => ViewOrderPage(selectedDate: selectedDate);
}

class ViewOrderPage extends State<ViewOrder> {
  DateTime selectedDate;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  ViewOrderPage({this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MilkInWay'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          Expanded(
              child: FutureBuilder(
                  future: viewCustomer(selectedDate),
                  builder: (context, AsyncSnapshot<Widget> snapshot) {
                    Widget widget = Container();
                    if (snapshot.hasData) {
                      widget = snapshot.data;
                    }
                    return widget;
                  })),
        ],
      ),
    );
  }

  Future<Widget> viewCustomer(DateTime date) async {
    uid = await getUserId();
    print(uid);
    Order order = await OrderDatabase().getOrderByDate(uid);
    if (date.compareTo(order.sdate) <= 0 && date.compareTo(order.edate) >= 0) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Item Name: '),
                Expanded(child: Text(order.itemName)),
              ],
            ),
          ],
        ),
      );
    }
    else{
      return Container(
        child: Text('Not Found'),
      );
    }
  }

  Future<String> getUserId() async {
    final FirebaseUser user = await auth.currentUser();
    uid = user.uid;
    return uid;
  }
}
