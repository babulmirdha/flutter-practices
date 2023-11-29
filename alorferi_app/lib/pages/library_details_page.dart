import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/endpoints.dart';
import '../constants/urls.dart';
import '../controllers/library_controller.dart';

class LibraryDetailsPage extends StatelessWidget {
  final LibraryController libraryController = Get.put(LibraryController());

  LibraryDetailsPage({super.key});

  final _keys = ['mobile', 'web_site_url'];

  @override
  Widget build(BuildContext context) {
    libraryController.fetchLibrary(libraryController.selectedLibrary.value.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Library Details"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16) ,
            child: Obx(() => ListTile(
                  leading: Image.network(
                      "${Urls.apiServerBaseUrl}${libraryController.selectedLibrary.value.logo_url ?? Endpoints.blankLibraryLogoUri}"),
                  title: Text(libraryController.selectedLibrary.value.name ?? ""),
                  subtitle: Text(
                      "${libraryController.selectedLibrary.value.mobile}"),
                  // Display other properties as needed
                )),
          ),
          Expanded(

            child: ListView.builder(
              padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {

                    return  ListTile(
                      title: Obx(() => Text("${_keys[index]}:${libraryController.selectedLibrary.value.toJson()[_keys[index]]}")),
                    );
                  },
                  itemCount: _keys
                          .length ??
                      0,
                )
            ),

        ],
      ),
    );
  }
}
