import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class Home extends StatelessWidget {
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
}
