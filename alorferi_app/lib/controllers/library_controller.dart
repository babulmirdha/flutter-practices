import 'dart:io';

import 'package:alorferi_app/constants/endpoints.dart';
import 'package:alorferi_app/models/address.dart';
import 'package:alorferi_app/models/district.dart';
import 'package:alorferi_app/models/police_station.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import '../constants/urls.dart';
import '../models/library.dart';
import '../models/object_wrapper.dart';
import '../services/library_service.dart';
import '../utils/CertReader.dart';
import 'login_controller.dart';

class LibraryController extends GetxController {
  var loginController = Get.find<LoginController>();

  final Dio _dio = Dio();

  var isLoading = false.obs;
  var token = "".obs;
  var libraryList = <Library>[].obs;
  var selectedLibrary = Library().obs;

  var library = Library(
          id: '',
          logo_url: '',
          name: '',
          address: Address(
              policeStation: PoliceStation(id: '', name: ""),
              district: District(id: "", name: "")))
      .obs;

 // late LibraryService _libService;

  @override
  void onInit() {
    token = loginController.token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
   // _libService = LibraryService(dio: _dio);
    super.onInit();
  }

  Future<void> fetchLibraries() async {
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
      final response = await _dio.get(
        '${Urls.apiServerBaseUrl}${Endpoints.libraryList}',
      );

      print("response.data ${response}");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        libraryList.assignAll(data
            .map((e) => Library.fromJson(ObjectWrapper.fromJson(e).attributes))
            .toList());

        // You can navigate to another page or perform other actions here
        // Get.snackbar('Success', 'Login successful');
      } else {
        // Failed login
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e, s) {
      print('Error during login: Error:$e, S:$s');

      Get.snackbar('Error', 'An error occurred during login');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchLibrary(String? id) async {
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
      final response = await _dio.get(
        '${Urls.apiServerBaseUrl}/api/libraries/$id',
      );

      print("response.data ${response}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];

        selectedLibrary.value =
            Library.fromJson(ObjectWrapper.fromJson(data).attributes);

        // You can navigate to another page or perform other actions here
        Get.snackbar('Success', 'Fetched Library List successful');
      } else {
        // Failed login
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e, s) {
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
