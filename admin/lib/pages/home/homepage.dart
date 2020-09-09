import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: null)
        ],
      ),
    );    
  }
}
