import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class SearchField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: TextField(
      onTap: () async {
        Prediction p = await PlacesAutocomplete.show(
            context: context,
            apiKey: "AIzaSyDPaFRwkTfLGUgDovW6ZrldT9e77mYR7sU",
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
  /*Widget build(BuildContext context){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
          hintText: "Search location",
          suffixIcon: Icon(Icons.search, color: Colors.black,),
          border: InputBorder.none,
        ),
      ),
    );
  }*/
}