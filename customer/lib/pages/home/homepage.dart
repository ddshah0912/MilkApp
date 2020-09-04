import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:customer/pages/home/product.dart';
import 'package:customer/pages/home/product_card.dart';
import 'package:customer/pages/home/searchfield.dart';
import 'package:table_calendar/table_calendar.dart';

/*class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: TextField(
      onTap: () async {
        Prediction p = await PlacesAutocomplete.show(
            context: context,
            apiKey: null,
            language: "en",
            components: [Component(Component.country, "in")]);
      },
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        icon: Container(
          margin: EdgeInsets.only(left: 20, top: 5),
          width: 10,
          height: 10,
          child: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
        hintText: "find location",
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
      ),
    )));
  }
}*/

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context){
    Widget image_slider_carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/images/img1.jpg'),
          AssetImage('assets/images/img2.jpg'),
          AssetImage('assets/images/img3.jpg'),
          AssetImage('assets/images/img4.jpg'),
          AssetImage('assets/images/img5.jpg'),
        ],
        autoplay: true,
        indicatorBgPadding: 1.0,
      ), 
    );
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 0.0, right: 0.0),
        children: <Widget>[
          SearchField(),
          Text("\n"),
          image_slider_carousel,
          Text("\n"),
          TableCalendar(calendarController: _controller, initialCalendarFormat: CalendarFormat.week, headerVisible: false, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("\nProducts\n", style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
                ],
              ),
            ],
          ),
          ProductCategory(),
        ],
      )
    );
  }
}
