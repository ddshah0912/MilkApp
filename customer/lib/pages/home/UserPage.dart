import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      height: 50.0,
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}