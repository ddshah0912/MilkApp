import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/pages/login.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      height: 50.0,
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12.0),
        child: GestureDetector(
          onTap: (){
              runApp(new MaterialApp(
                  home: new Login()
                ));
          },
          child: Center(
            child: Text('Logout',
            style: TextStyle(
              color:Colors.black
            ),
            ),
          ),
        ),
      ),
    );
  }
}