import 'package:flutter/material.dart';
import 'package:login/pages/home.dart';
import 'package:login/pages/login.dart';
//import 'package:login/pages/SignupPage.dart';
//import 'package:flutter/gestures.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Screen ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'Login',
      routes: {
        'Login':(context)=>Login(),
         //'SignUp':(context)=>SignUpPage(),
         'Home':(context)=>MyTabs(),
      },
    );
  }
}