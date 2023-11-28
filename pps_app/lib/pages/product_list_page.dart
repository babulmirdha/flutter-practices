import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductListPage extends StatelessWidget {

  ProductController controller = Get.put(ProductController());

   ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
      body: Obx(()=> ListView.builder(itemBuilder: (context, index){
        var product = controller.productList[index];
        return ListTile(
          title: Text(product.name)  ,
          subtitle:  Text(product.price.toString()),
        );

      },
        itemCount: controller.productList.length,
      )) ,
    );
  }
}

