import 'package:flutter/material.dart';
import 'homepage.dart';

class View extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'MilkInWay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'Home',
      routes:{
        'Home':(context)=>Home(),
      },
    );
  }
}