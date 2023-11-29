import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nayon_test/app_config.dart';
import 'package:nayon_test/view/product/product_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

  //login
  static Future login({required String email, required String pass, required BuildContext context})async{
    SharedPreferences _pref = await SharedPreferences.getInstance(); //shared preferences instance


    var res = await http.post(Uri.parse(AppConfig.LOGIN),
      body: {
        "grant_type": "password",
        "client_id": "2",
        "client_secret": "Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
        "username": "$email",
        "password": "$pass"
      }
    );


    if(res.statusCode == 200){// if status code is success, then

      var data = jsonDecode(res.body); //convert response

      _pref.setString("token", data["access_token"] ); //store token in to local store

      //and next to redirect in to prodict list page
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductList()), (route) => false);

      //show some mes for user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Login success.'),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 3000),
      ));


    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Something went wrong. '),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 3000),
      ));

    }
  }

}