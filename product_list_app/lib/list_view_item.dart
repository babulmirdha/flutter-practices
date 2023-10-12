import 'package:flutter/material.dart';
import 'package:product_layout_app/Product.dart';

class ListViewItem extends StatelessWidget {

 final Product item;

 final Function(Product, BuildContext) onItemSelected;

  const ListViewItem(
      {super.key,
      required this.item, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemSelected(item, context);
      },
      child: Container(
          padding: const EdgeInsets.all(4),
          height: 120,
          child: Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                SizedBox(
                    width: 72, child: Image.asset("assets/appimages/${item.image}")),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(item.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.description)),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Price: ${item.price}")),
                          ],
                        )))
              ]))),
    );
  }
}
