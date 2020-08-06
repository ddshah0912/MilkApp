import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Second extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Icon(Icons.date_range, size: 150.0, color: Colors.black),
      )
    );
  }
}