import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/urls.dart';
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
          leading:SizedBox(
            height: 50,
            width: 50,
            child: CachedNetworkImage(
            //  imageUrl: "${Urls.apiServerBaseUrl}/storage/images/21e4ab92-11a9-498f-94e2-a50aed4aef27.jpg",
              imageUrl: Urls.apiServerBaseUrl+product.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // child:Image.network(Urls.apiServerBaseUrl+product.imageUrl),
          ),
          title: Text(product.name)  ,
          subtitle:  Text(product.price.toString()),
        );

      },
        itemCount: controller.productList.length,
      )) ,
    );
  }
}

