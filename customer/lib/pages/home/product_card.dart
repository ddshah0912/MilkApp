import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{

  final String productName;
  final String imagePath;
  final int productPrice;
  final int productQuantity;

  ProductCard({this.productName, this.imagePath, this.productPrice, this.productQuantity});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 65.0,
                width: 65.0,
              ),
              SizedBox(width: 20.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  Text(productQuantity.toString()+"ml"),
                  //Text("Price: "+productPrice.toString()),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}