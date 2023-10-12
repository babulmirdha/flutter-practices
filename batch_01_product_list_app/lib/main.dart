import 'package:batch_01_product_list_app/list_view_item.dart';
import 'package:batch_01_product_list_app/product.dart';
import 'package:flutter/material.dart';

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

  List<Product> getProductList(){

    List<Product> list = [];

    list.add(Product("iPhone", "This is iPhone", 80000 ));
    list.add(Product("Xi Redme", "This is Xi Redme", 50000 ));
    list.add(Product("Oppo", "This is Oppo", 30000 ));

    return list;
  }
  
  @override
  Widget build(BuildContext context) {

  var productList  = getProductList();

  List<ListViewItem> listViewItems = [];

  for(var product in productList){
    listViewItems.add(ListViewItem(product: product));
  }


    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children:listViewItems,
        )
    );
  }
  
}
