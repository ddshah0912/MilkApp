import 'package:flutter/material.dart';
import 'package:admin/models/item.dart';
import 'package:admin/services/database/itemdatabase.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  ItemTile({this.item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.amberAccent,
          ),
          title: Text('${item.name}'),
          subtitle:Text('Price: ${item.price}   Quantity: ${item.quantity}'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async{
              print(item.id);
              await ItemDatabase().updateAttr(item.id,'new',14,14);
            })),
        ),
      );
  }
}