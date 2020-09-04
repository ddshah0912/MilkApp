import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email, _password, _error = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('MilkInWay'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.email), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                debugPrint('Enter UserName');
                                return 'Enter User Name';
                              }
                            },
                            onChanged: (input) {
                              setState(() => _email = input);
                            },
                            decoration: InputDecoration(hintText: 'email'),
                          )))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length < 6) {
                                return 'Password length too short';
                              }
                            },
                            onChanged: (input) {
                              setState(() => _password = input);
                            },
                            decoration: InputDecoration(hintText: 'Password'),
                            obscureText: true,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async {
                      print(_email);
                      // print(_password);
                      if (_formkey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        print(result);
                        if (result == null) {
                          setState(() => _error = 'Invalid credentials');
                        }
                      }
                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              _error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
            onTap: (){
              widget.toggleView();
            },
              child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
