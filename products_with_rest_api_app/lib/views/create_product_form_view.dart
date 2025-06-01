import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class CreateProductFormView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text("New Product")),
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
                  id:  0,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descController.text,
                );
                controller.add(product);
                Get.back();
              },
              child: Text("Create"),
            )
          ]),
        ),
      ),
    );
  }
}
