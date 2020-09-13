import 'package:admin/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/order.dart';
import 'package:admin/services/database/customerdatabase.dart';

class ViewOrderDetails extends StatefulWidget {
  final Order order;
  ViewOrderDetails({this.order});
  @override
  _ViewOrderDetailsState createState() => _ViewOrderDetailsState(order: order);
}

class _ViewOrderDetailsState extends State<ViewOrderDetails> {
  final Order order;
  _ViewOrderDetailsState({this.order});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MilkInWay'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          Text(order.custId),
          Expanded(
            child: FutureBuilder(
              future: viewCustomer(),
              builder: (context,AsyncSnapshot<Widget> snapshot){
              Widget widget=Container();
              if(snapshot.hasData){
                widget=snapshot.data;
              }
              return widget;
            })),
        ],
      ),
    );
  }

  Future<Widget> viewCustomer() async {
    Customer customer = await CustomerDatabase().getCustomerById(order.custId);
    //print(customer.firstname);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Customer Name: '),
              Expanded(
                  child: Text(customer.firstname)),
            ],
          ),
        ],
      ),
    );
  }
}
