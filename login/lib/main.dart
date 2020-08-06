import 'package:flutter/material.dart';

void main()
{
  runApp(app1());
}

class app1 extends StatelessWidget{
  @override
  Widget build(BuildContext cotext){
    return MaterialApp(title: "Log In",home: LoginPage());
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Log In", 
              style:TextStyle(
                fontSize: 40.0, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgot Password?", style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),),
              ],
            ),
            SizedBox(height: 10.0),
            Card(
              elevation: 5.0,
              child: Padding( 
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: Center(
                child: Text("Log In", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text("Dont have an account?", style: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10.0,),
                  Text("Sign Up", style: TextStyle(color: Colors.blueAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        )
      ),
    );
  }
}