import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate;
  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime.now().add(Duration(days: 0)),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: new DateTime(DateTime.now().year + 50),
    );

    if (picked != null && picked.length == 1) {
      setState(() {
        selectedDate=picked[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    await displayDateRangePicker(context);
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SelectDate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),     
    );
  }
}