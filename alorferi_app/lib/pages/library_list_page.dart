import 'package:alorferi_app/constants/endpoints.dart';
import 'package:alorferi_app/constants/urls.dart';
import 'package:alorferi_app/pages/library_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryListPage extends StatelessWidget {
  final LibraryController libraryController = Get.put(LibraryController());

   LibraryListPage({super.key}) {
     libraryController.fetchLibraries();
   }

  // LibraryListPage({Key? key}) : super(key: key)
  // {
  //   libraryController.fetchLibraries();
  // }

  @override
  Widget build(BuildContext context) {


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
                  libraryController.selectedLibrary.value = library;

                  Get.to(() => LibraryDetailsPage());

                },
                child: ListTile(
                  leading: Image.network(
                      "${Urls.apiServerBaseUrl}${library.logo_url ?? Endpoints.blankLibraryLogoUri}"),
                  title: Text(library.name ?? "" ),
                  subtitle: Text(
                      "${library.mobile}"),
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
