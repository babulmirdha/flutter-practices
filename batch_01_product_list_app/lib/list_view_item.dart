import 'package:batch_01_product_list_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget{

  Product product;

  ListViewItem({required this.product});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(children: [

        Expanded(
            flex: 3,
            child: Image.asset("")),
        Expanded(
            flex: 7,
            child: Column(
          children: [
            Text(this.product.name),
            Text(this.product.desc),
            Text("Price: ${this.product.price}"),
          ],
        ))
      ],),
    );

  }

}