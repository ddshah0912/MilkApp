import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Icon(Icons.contact_phone, size: 150.0, color: Colors.black),
      )
    );
  }
}