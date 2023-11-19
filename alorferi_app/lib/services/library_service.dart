import 'package:dio/dio.dart';
import '../models/library.dart';


// class LibraryService {
//
//   final Dio dio;
//
//   LibraryService({required this.dio})
//
//
//   // List<Library> fetchLibraries() {
//   //
//   //   List<Library> libraryList = [];
//   //
//   //
//   //   // Configure Dio to use the loaded certificate
//   //   // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//   //   //     (HttpClient client) {
//   //   //   client.badCertificateCallback =
//   //   //       (X509Certificate cert, String host, int port) {
//   //   //     // Compare the server's certificate with the pinned certificate
//   //   //     // You can replace this with your own logic for certificate verification
//   //   //     return cert.pem == String.fromCharCodes(CertReader.getCertData());
//   //   //   };
//   //   // };
//   //   //
//   //   // // Make the network request
//   //   // final response = await dio.get(
//   //   //   '${Urls.apiServerBaseUrl}${Endpoints.libraryList}?',
//   //   // );
//   //   //
//   //   // print("response.data ${response}");
//   //   //
//   //   // if (response.statusCode == 200) {
//   //   //   final List<dynamic> data = response.data['data'];
//   //   //
//   //   //
//   //   //   libraryList.assignAll(data
//   //   //       .map((e) =>
//   //   //       Library.fromJson(ObjectWrapper
//   //   //           .fromJson(e)
//   //   //           .attributes))
//   //   //       .toList());
//   //   //
//   //   //   // You can navigate to another page or perform other actions here
//   //   //   Get.snackbar('Success', 'Login successful');
//   //   // } else {
//   //   //   // Failed login
//   //   //   Get.snackbar('Error', 'Invalid credentials');
//   //   // }
//   //
//   //
//   //   return libraryList;
//   // }
//
// }
