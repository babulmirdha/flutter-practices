import 'package:flutter/material.dart';
import 'package:product_list_app/models/product.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;

  const ListItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(product.image),
        ),
        Expanded(
            child: Column(children: [
          Text(product.name),
          Text(product.price.toString()),
          Text(product.description.toString())
        ]))
      ]),
    );
  }
}
