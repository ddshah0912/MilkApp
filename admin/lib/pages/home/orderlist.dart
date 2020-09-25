import 'package:admin/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/pages/home/ordertile.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final List<Order> orders = Provider.of<List<Order>>(context);

    if (orders == null) {
      return Container(
        child:Text('No Orders'),
      );
    } else {
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          if (orders[index] != null) {
            return OrderTile(order: orders[index]);
          }
        },
      );
    }
  }
}
