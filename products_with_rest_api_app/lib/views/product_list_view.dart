import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (_, index) {
        final product = controller.products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            controller.select(product);
            Get.toNamed('/details');
          },
        );
      },
    ));
  }
}
