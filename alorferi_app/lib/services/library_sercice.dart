// employee_service.dart
import 'dart:convert';
import 'package:alorferi_app/models/library.dart';
import 'package:alorferi_app/models/object_wrapper.dart';
import 'package:alorferi_app/services/base_service.dart';
import 'package:get/get.dart';

import '../constants/endpoints.dart';
import '../constants/urls.dart';
import '../models/list_paging_wrapper.dart';

class LibraryService extends BaseService {
  Future<ListPagingWrapper?> fetchLibraries(int page, int pageSize) async {
    try {
      var endPoint =
          '${Urls.apiServerBaseUrl}${Endpoints.libraryList}?page=$page';

      print(endPoint);

      // Make the network request
      final response = await dio.get(
        endPoint,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        var listData = data
            .map((e) => Library.fromJson(ObjectWrapper.fromJson(e).attributes))
            .toList();

        final pagingWrapper = ListPagingWrapper<List<Library>>(
            list: listData,
            current_page: response.data['meta']['current_page'],
            last_page: response.data['meta']['last_page']);
        return pagingWrapper;
      } else {
        // Failed login
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e, s) {
      print('Error during login: Error:$e, S:$s');

      Get.snackbar('Error', 'An error occurred during fetchLibraries');
    }

    return null;
  }
}
