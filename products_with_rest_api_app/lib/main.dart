import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_with_rest_api/views/create_product_form_view.dart';
import 'controllers/product_controller.dart';
import 'views/product_list_view.dart';
import 'views/product_detail_view.dart';
import 'views/edit_product_form_view.dart';

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
        GetPage(name: '/edit', page: () => EditProductFormView()),
        GetPage(name: '/create', page: () => CreateProductFormView()),
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
        onPressed: () => Get.toNamed('/create'),
        child: Icon(Icons.add),
      ),
    );
  }
}
