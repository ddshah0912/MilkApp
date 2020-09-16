import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase{
  final String uid;
  UserDatabase({this.uid});

  final CollectionReference adminCollection=Firestore.instance.collection('customer');

  Future<void> updateUserData(String fname,String lname,String contact) async {
    return await adminCollection.document(uid).setData({
      'firstname':fname,
      'lastname':lname,
      'contact':contact,
    });
  }

  Future<void> updateAttr(String id, String houseNo, String landmark, String city, String pincode, String country) async{
    return await adminCollection.document(id).updateData({
      'houseNo': houseNo,
      'landmark': landmark,
      'city': city,
      'pincode': pincode,
      'country': country
    });
  }

}