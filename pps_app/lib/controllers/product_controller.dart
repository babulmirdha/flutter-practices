import 'dart:convert';

import 'package:get/get.dart';
import 'package:pps_app/constants/Endpoints.dart';
import 'package:pps_app/models/product.dart';
import 'package:http/http.dart' as http;

import '../constants/urls.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProductList();

    super.onInit();
  }

  Future<void> fetchProductList() async {
    try {
      var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.products}");

      var response = await http.get(url);

      if (response.statusCode == 200) {

        Map<String, dynamic> dataMap = jsonDecode(response.body);

        List<dynamic> jsonList = dataMap['data'];

        for (var element in jsonList) {
          productList.value.add(Product(
            id: element['id'],
            name: element['name'],
            price: element['price'],
          ));
        }
      }
    } catch (e, s) {
      print("error: $e, stack trace: $s");
    }
  }
}
