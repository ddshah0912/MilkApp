import 'package:flutter/material.dart';
import 'package:customer/data/product_data.dart';
import 'package:customer/models/product_model.dart';
import 'product_card.dart';

class ProductCategory extends StatelessWidget{

  final List<Product> _product = products;


  @override
  Widget build(BuildContext context){
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return ProductCard(
            productName: _product[index].productName,
            imagePath: _product[index].imagePath,
            productPrice: _product[index].productPrice,
            productQuantity: _product[index].productQuantity,
          );
        },
      ),
    );
  }
}