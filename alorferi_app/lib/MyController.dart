import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class MyController extends GetxController {
  final Dio _dio = Dio();

  Future<void> fetchData() async {
    try {
      // Load the server's certificate (in PEM format) from an asset file
      final ByteData data = await rootBundle.load('assets/cert.pem');
      final Uint8List certBytes = data.buffer.asUint8List();

      // Configure Dio to use the loaded certificate
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          // Compare the server's certificate with the pinned certificate
          // You can replace this with your own logic for certificate verification
          return cert.pem == String.fromCharCodes(certBytes);
        };
      };

      // Make the network request
       var response = await _dio.get('https://example.com/data');
      print(response.data);
    } catch (e) {
      print('Error: $e');
    }
  }
}
