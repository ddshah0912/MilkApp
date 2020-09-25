import 'package:customer/models/user.dart';
import 'package:customer/pages/home.dart';
import 'package:customer/services/database/userdatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class userPage extends StatefulWidget {
  @override
  _EditUserPage createState() => _EditUserPage();
}

class _EditUserPage extends State<userPage> {

  final _itemForm = GlobalKey<FormState>();

  String uid, fname, lname, contact;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool showPassword = false;

  //_EditUserPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
          },
        ),
      ),*/
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: viewCustomer(),
                      builder: (context, AsyncSnapshot<Widget> snapshot) {
                        Widget widget = Container();
                        if (snapshot.hasData) {
                          widget = snapshot.data;
                        }
                        return widget;
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(User user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      /*child: Form(
        key: _itemForm,
        child: Column(
          children: <Widget>[
            TextFormField(
              //initialValue: user.firstname,
              //enabled: true,
              /*decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "First Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),*/
              validator: (input) {
                if (input.isEmpty) {
                  return 'Name is empty';
                }
              },
              onSaved: (input) {
                this.fname = input;
              },
              initialValue: user.firstname,
            ),*/
      child: Form(
        key: _itemForm,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "First Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Name is empty';
                              }
                            },
                            onSaved: (input) {
                              this.fname = input;
                            },
                            initialValue: user.firstname,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "Last Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Name is empty';
                              }
                            },
                            onSaved: (input) {
                              this.lname = input;
                            },
                            initialValue: user.lastname,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                labelText: "Contact",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            validator: (input) {
                              if (input.length != 10) {
                                return 'Enter 10-digit contact number';
                              }
                            },
                            onSaved: (input) {
                              this.contact = input;
                            },
                            initialValue: user.contact,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _itemForm.currentState.reset();
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_itemForm.currentState.validate()) {
                        _itemForm.currentState.save();
                        //Navigator.of(context).pop();
                        await UserDatabase()
                            .updateData(uid, fname, lname, contact);
                      }
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getUserId() async {
    final FirebaseUser user = await _auth.currentUser();
    uid = user.uid;
    return uid;
  }

  Future<Widget> viewCustomer() async {
    uid = await getUserId();
    User user = await UserDatabase().getCustomerById(uid);
    //print(uid);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: buildTextField(user),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
