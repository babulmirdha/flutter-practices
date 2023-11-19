import 'dart:convert';
import 'dart:io';
import 'package:alorferi_app/pages/library_list_page.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

import '../constants/endpoints.dart';
import '../constants/urls.dart';
import '../utils/CertReader.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  final Dio _dio = Dio();


  @override
  void onInit() {
    CertReader.initialize();
    super.onInit();
  }

  Future<void> login(String username, String password) async {
    try {

      // Configure Dio to use the loaded certificate
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          // Compare the server's certificate with the pinned certificate
          // You can replace this with your own logic for certificate verification
          return cert.pem == String.fromCharCodes(CertReader.getCertData());
        };
      };

      // Make the network request
    String url = '${Urls.apiServerBaseUrl}${Endpoints.login}';
    final response = await _dio.post(
        url,
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

        // Navigate to the employee page
        Get.offAll(() => LibraryListPage()); // Replace EmployeePage with the actual page you want to navigate to

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
