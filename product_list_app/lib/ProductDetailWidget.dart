import 'package:flutter/material.dart';
import 'package:product_layout_app/ProductItem.dart';


class ProductDetailWidget extends StatelessWidget {
  final ProductItem item;

  const ProductDetailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                  height: 400,
                  child: Image.asset("assets/appimages/${item.image}")),
            ),
            const SizedBox(height: 10),
            Text(item.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}