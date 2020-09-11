import 'package:customer/models/item.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:customer/services/database/itemdatabase.dart';

class Subscribe extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Subscribe',
      home: SubscribePage(),
    );
  }
}

class SubscribePage extends StatelessWidget{
  final Item item;
  SubscribePage({this.item});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Calendar'),
      //),
      //print(item.id),
      body: ListView(
        children: <Widget>[
          Text('${item.name}'),
        ],
      ),
    );
  }
}