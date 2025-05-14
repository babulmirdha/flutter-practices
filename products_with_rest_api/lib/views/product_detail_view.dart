import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductDetailView extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: BackButton(onPressed: () => Get.back()), // Optional, auto-handled
      ),
      body: Obx(() {
        final product = controller.selectedProduct.value;
        if (product == null) return Center(child: Text("No product selected"));

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: TextStyle(fontSize: 24)),
              SizedBox(height: 8),
              Text(product.description),
              SizedBox(height: 8),
              Text('\$${product.price}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Get.toNamed('/edit'),
                    child: Text("Edit"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      controller.delete(product.id);
                      Get.back(); // Go back after deleting
                    },
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
