import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class ProductFormView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.selectedProduct.value != null;

    if (isEdit) {
      final product = controller.selectedProduct.value!;
      nameController.text = product.name;
      priceController.text = product.price.toString();
      descController.text = product.description;
    }

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Product" : "New Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextFormField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
            TextFormField(controller: descController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: isEdit ? controller.selectedProduct.value!.id : 0,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descController.text,
                );
                isEdit ? controller.updateProduct(product) : controller.add(product);
                Get.back();
              },
              child: Text(isEdit ? "Update" : "Create"),
            )
          ]),
        ),
      ),
    );
  }
}
