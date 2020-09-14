import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/order.dart';

class OrderDatabase{

  final CollectionReference orderCollection=Firestore.instance.collection('orders');

  //get list from snapshot
  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Order(
        id: doc.documentID,
        custId: doc.data['custId'] ?? '',
        sdate: doc.data['sdate'].toDate() ?? 0,
        edate: doc.data['edate'].toDate() ?? 0,
        noOfItem: doc.data['noOfItem'] ?? 0,
        amount: doc.data['amount'] ?? 0,
        itemId: doc.data['itemId'] ?? '',
      );
    }).toList();
  }

  Future<void> updateOrderData(String custId, String itemId,DateTime sdate,DateTime edate,int noOfItem,) async {
    return await orderCollection.document().setData({
      'custId': custId,
      'itemId': itemId,
      'sdate': sdate,
      'edate': edate,
      'noOfItem': noOfItem,
    });
  }

  //get item snapshot
  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }
}