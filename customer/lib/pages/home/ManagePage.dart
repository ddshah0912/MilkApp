import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';

class Manage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Calendar',
      home: ManagePage(),
    );
  }
}

class ManagePage extends StatelessWidget{
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Calendar'),
      //),
      body: Center(
        child: TableCalendar(calendarController: _controller, initialCalendarFormat: CalendarFormat.month,),
      ),
    );
  }
}