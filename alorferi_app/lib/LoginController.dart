import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  final Dio _dio = Dio();


  @override
  void onInit() {
    super.onInit();
  }




  // Future<void> loginX(String username, String password) async {
  //   try {
  //     isLoading(true);
  //
  //     final response = await http.post(
  //       Uri.parse('https://backoffice.alorferi.com/api/auth/login'),
  //       body: {
  //         'username': username,
  //         'password': password,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       token(data['token']);
  //
  //       // You can navigate to another page or perform other actions here
  //       Get.snackbar('Success', 'Login successful');
  //     } else {
  //       // Failed login
  //       Get.snackbar('Error', 'Invalid credentials');
  //     }
  //   } catch (error) {
  //     print('Error during login: $error');
  //     Get.snackbar('Error', 'An error occurred during login');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> login(String username, String password) async {
    try {
      // Load the server's certificate (in PEM format) from an asset file
      final ByteData data = await rootBundle.load('assets/certs/alorferi_com.cer');
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
    final response = await _dio.post(
        'https://backoffice.alorferi.com/api/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      print("response.data ${response.data}"  );

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = response.data;
        //
        print(data);
        token(data['data']['token']);

        // You can navigate to another page or perform other actions here
        Get.snackbar('Success', 'Login successful');
      } else {
        // Failed login
        Get.snackbar('Error', 'Invalid credentials');
      }

    } catch (e,s) {
      print('Error during login: Error:$e, S:$s');

      Get.snackbar('Error', 'An error occurred during login');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    // Close the httpClient when the controller is disposed
    super.onClose();
  }
}
