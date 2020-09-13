import 'package:admin/models/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerDatabase{
  final CollectionReference customerCollection = Firestore.instance.collection('customer');
  
  Future<Customer> getCustomerById(String id) async {
    DocumentSnapshot doc= await customerCollection.document(id).get();
    return Customer(
      id: id,
      contact: doc.data['contact'],
      firstname: doc.data['firstname'],
      lastname: doc.data['lastname'], 
    );
  }
}