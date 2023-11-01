
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  Product product;

  ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/appimages/${this.product.imageName}"),
            Text(product.name),
            Text(product.desc)
          ],
        ),
      ),
    );
  }
}
