import 'package:alorferi_app/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/library_controller.dart';

class LibraryListPage extends StatelessWidget {
  final LibraryController libraryController = Get.put(LibraryController());

  LibraryListPage({super.key});

  @override
  Widget build(BuildContext context) {

    libraryController.fetchLibraries();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library List'),
      ),
      body: Obx(() {
        if (libraryController.libraryList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: libraryController.libraryList.length,
            itemBuilder: (context, index) {
              final library = libraryController.libraryList[index];
              return InkWell(
                onTap: (){

                },
                child: ListTile(
                  leading: Image.network(
                      "${Urls.apiServerBaseUrl}${library.logo_url}"),
                  title: Text(library.name),
                  subtitle: Text(
                      "${library.address.policeStation.name}, ${library.address.district.name}"),
                  // Display other properties as needed
                ),
              );
            },
          );
        }
      }),
    );
  }
}
