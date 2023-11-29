import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nayon_test/app_config.dart';
import 'package:nayon_test/model/product_model.dart';
import 'package:nayon_test/view/product/product_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController{

  //get all product
  static Future<ProductModel>getAllProduct()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.PRODUCTS),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );

    return ProductModel.fromJson(jsonDecode(res.body));
  }


  //====================================
  //add new product
  //====================================
  static Future addNewProduct({required BuildContext context , required String name, required String price, required dynamic image})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");


    var request =  http.MultipartRequest(
        'POST', Uri.parse(AppConfig.PRODUCTS)
    );
    request.headers['Authorization'] ='Bearer $token';
    request.fields['name'] = name.toString();
    request.fields['price'] = price.toString();
    // Add files to the request
    var file = await http.MultipartFile.fromPath(
      'image', // Replace with your field name for the file
      image.path,
    );

    request.files.add(file);
    // Send the request
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        // Request was successful
        print('Uploaded!');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Product Added Success.'),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 3000),
        ));

        //navigat to the main product page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()));

      }else if (response.statusCode == 302) {
        // Handle redirection
        var redirectUrl = response.headers['location'];
        print('Redirecting to: $redirectUrl');
        // You can choose to follow the redirection by making another request to the new URL
        // Example: await makeHttpRequest(redirectUrl);
      }  else {
        // Handle error
        print('Failed to upload. Status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');

      }
    } catch (error) {
      // Handle network or server errors
      print('Error: $error');
    }

  }

//====================================
  //add new product
  //====================================
  static Future updateProduct({required BuildContext context , required String name, required String price, required dynamic image, required String id})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");


    var request =  http.MultipartRequest(
        'POST', Uri.parse(AppConfig.PRODUCTS+"/${id}?_method=PUT")
    );
    request.headers['Authorization'] ='Bearer $token';
    request.fields['name'] = name.toString();
    request.fields['price'] = price.toString();
    // Add files to the request
    if(image != null){
      // Add files to the request
      var file = await http.MultipartFile.fromPath(
        'image', // Replace with your field name for the file
        image.path,
      );
      request.files.add(file);

    }
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        // Request was successful
        print('Uploaded!');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Product updated Success.'),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 3000),
        ));

        //navigat to the main product page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()));

      } else {
        // Handle error
        print('Failed to upload. Status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');

      }
    } catch (error) {
      // Handle network or server errors
      print('Error: $error');
    }

  }



  //====================================
  //delete product
  //====================================
  static Future deleteProduct({required String product_id, required BuildContext context})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.delete(Uri.parse("${AppConfig.PRODUCTS}/$product_id"),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );

    if(res.statusCode == 200){
      //show some msg
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Product Delete Success.'),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 3000),
      ));
    }
  }


}