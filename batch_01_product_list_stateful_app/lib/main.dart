import 'dart:convert';

import 'package:batch_01_product_list_app/list_view_item.dart';
import 'package:batch_01_product_list_app/product.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<Product> getProductList() {
    List<Product> list = [];

    list.add(Product("iphone.png", "iPhone", "This is iPhone", 80000));
    list.add(Product("floppy.png", "Floppy disk", "This is Floppy disk", 50));
    list.add(Product("pendrive.png", "Pen drive", "This is Pendrive", 1000));

    return list;



  }

  Future<String> loadProductsAsString() async {
    return await rootBundle.loadString('assets/products.json');
  }

  Future<String> loadJsonAsString(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/products.json');
  }

  @override
  Widget build(BuildContext context) {
    var productList = getProductList();

    // List<ListViewItem> listViewItems = [];
    // for(var product in productList){
    //   listViewItems.add(ListViewItem(product: product));
    // }

    var futureJson = loadProductsAsString();

    futureJson.then((value) {
      var list = jsonDecode(value);

      List<Product> products = [];
      for (var map in list) {
        products.add(
            Product(map['image_name'], map['name'], map['desc'], map['price']));
      }

      return products;
    });


    return Scaffold(
      appBar: AppBar(),
      // body: ListView(
      //   children:listViewItems,
      // )

      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListViewItem(product: productList[index]);
        },
      ),
    );
  }
}
