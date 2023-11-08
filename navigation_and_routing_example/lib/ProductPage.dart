import 'package:flutter/material.dart';

import 'Product.dart';
import 'RatingBox.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({ super.key, required this.item});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimages/${item.image}"),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                                item.name, style: const TextStyle(
                                fontWeight: FontWeight.bold
                            )
                            ),
                            Text(item.description),
                            Text("Price: ${item.price}"),
                            const RatingBox(),
                          ],
                        )
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}