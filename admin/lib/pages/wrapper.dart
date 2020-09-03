import 'package:admin/models/user.dart';
import 'package:admin/pages/authenticate/authenticate.dart';
import 'package:admin/pages/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/models/user.dart';
import 'home/homepage.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final user=Provider.of<User>(context); 
    
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }

    
  }
}