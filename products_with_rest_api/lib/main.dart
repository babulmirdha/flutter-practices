import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/product_controller.dart';
import 'views/product_list_view.dart';
import 'views/product_detail_view.dart';
import 'views/product_form_view.dart';

void main() {
  Get.put(ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product List',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ProductListPage()),
        GetPage(name: '/details', page: () => ProductDetailView()),
        GetPage(name: '/edit', page: () => ProductFormView()),
      ],
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: ProductListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/edit'),
        child: Icon(Icons.add),
      ),
    );
  }
}
