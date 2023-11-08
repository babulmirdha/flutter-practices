import 'dart:convert';

import 'package:batch_01_product_list_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/list_view_item.dart';
import '../models/product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _productList = [];

  // void prepareProductList() {
  //   List<Product> list = [];
  //
  //   list.add(Product("iphone.png", "iPhone", "This is iPhone", 80000));
  //   list.add(Product("floppy.png", "Floppy disk", "This is Floppy disk", 50));
  //   list.add(Product("pendrive.png", "Pen drive", "This is Pendrive", 1000));
  //
  //   setState(() {
  //     _productList = list;
  //   });
  // }

  Future<String> readProductsAsString() async {
    return await rootBundle.loadString('assets/products.json');
  }

  // Future<String> loadJsonAsString(BuildContext context) async {
  //   return await DefaultAssetBundle.of(context)
  //       .loadString('assets/products.json');
  // }

  loadProductListFromJsonFile() {
    var productListString = readProductsAsString();

    productListString.then((value) {
      var list = jsonDecode(value);

      List<Product> products = [];

      for (var map in list) {
        // setState(() {
        products.add(
            Product(map['image_name'], map['name'], map['desc'], map['price']));
        // });
      }

      setState(() {
        _productList = products;
      });
    });
  }

  @override
  void initState() {
    // prepareProductList();

    loadProductListFromJsonFile();

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
          return GestureDetector(
              onTap: () {
                var product = _productList[index];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(product: product)));
              },
              child: ListViewItem(product: _productList[index]));
        },
      ),
    );
  }
}
