import 'package:flutter/material.dart';
import 'package:product_list_app/models/list_item_widzard.dart';
import 'package:product_list_app/models/product.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body:
      ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) =>
            ListItemWidget(product: products[index]),
      ),
    );
  }
}
