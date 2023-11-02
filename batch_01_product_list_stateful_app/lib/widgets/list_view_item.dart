
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ListViewItem extends StatelessWidget {
  Product product;

  ListViewItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
              width: 72,
              height: 72,
              child: Image.asset(
                "assets/appimages/${this.product.imageName}",
                fit: BoxFit.contain,
              )),
          Expanded(
              child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft, child: Text(this.product.name)),
              Text(this.product.desc),
              Text("Price: ${this.product.price}"),
            ],
          ))
        ],
      ),
    );
  }
}
