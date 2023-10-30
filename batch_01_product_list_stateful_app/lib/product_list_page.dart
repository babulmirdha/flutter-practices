
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'list_view_item.dart';
import 'product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  @override
  State<ProductListPage> createState() => _ProductListPageState();

}

class _ProductListPageState extends State<ProductListPage> {




  List<Product> _productList = [];

void prepareProductList() {

  List<Product> list = [];

  list.add(Product("iphone.png", "iPhone", "This is iPhone", 80000));
  list.add(Product("floppy.png", "Floppy disk", "This is Floppy disk", 50));
  list.add(Product("pendrive.png", "Pen drive", "This is Pendrive", 1000));

    setState(() {
      _productList = list;
    });

  }

  Future<String> loadProductsAsString() async {
    return await rootBundle.loadString('assets/products.json');
  }

  Future<String> loadJsonAsString(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/products.json');
  }

  loadProductList(){
    var futureJson = loadProductsAsString();

    futureJson.then((value) {
      var list = jsonDecode(value);

     // List<Product> products = [];
      for (var map in list) {
        setState(() {
          _productList.add(
              Product(map['image_name'], map['name'], map['desc'], map['price']));
        });

      }

      // setState(() {
      //   _productList = products;
      // });

    });
  }


  @override
  void initState() {

    // prepareProductList();

    loadProductList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {






    return Scaffold(
      appBar: AppBar(),
      // body: ListView(
      //   children:listViewItems,
      // )

      body: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return ListViewItem(product: _productList[index]);
        },
      ),
    );
  }


}