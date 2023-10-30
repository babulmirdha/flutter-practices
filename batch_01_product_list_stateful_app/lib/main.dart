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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {




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

      List<Product> products = [];
      for (var map in list) {
        products.add(
            Product(map['image_name'], map['name'], map['desc'], map['price']));
      }

      setState(() {
        _productList = products;
      });

    });
  }


  @override
  void initState() {

    // prepareProductList();

    loadProductList();

    // List<ListViewItem> listViewItems = [];
    // for(var product in productList){
    //   listViewItems.add(ListViewItem(product: product));
    // }


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

