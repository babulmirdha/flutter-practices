
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../utils/CertReader.dart';

class BaseService{

  var loginController = Get.find<LoginController>();

   final Dio dio = Dio();

  BaseService(){


   var token = loginController.token;
    dio.options.headers['Authorization'] = 'Bearer $token';

   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
       (HttpClient client) {
     client.badCertificateCallback =
         (X509Certificate cert, String host, int port) {
       // Compare the server's certificate with the pinned certificate
       // You can replace this with your own logic for certificate verification
       return cert.pem == String.fromCharCodes(CertReader.getCertData());
     };
   };

  }


}

