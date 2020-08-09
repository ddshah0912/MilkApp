import 'package:flutter/material.dart';
import './HomePage.dart' as home;
import './ManagePage.dart' as manage;
import './ContactPage.dart' as contact;
import './UserPage.dart' as user;

class MyTabs extends StatefulWidget{
  @override
  MyTabState createState() => new MyTabState();
}

class MyTabState extends State<MyTabs> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MilkInWay"),
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.date_range)),
            new Tab(icon: new Icon(Icons.contact_phone)),
            new Tab(icon: new Icon(Icons.person)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new home.Home(),
          new manage.Manage(),
          new contact.Contact(),
          new user.User()
        ],
      )
    );
  }
}