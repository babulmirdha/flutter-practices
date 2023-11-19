// library_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/endpoints.dart';
import '../constants/urls.dart';
import '../controllers/library_controller.dart';

class LibraryListPaginate extends StatelessWidget {
  final LibraryController libraryController = Get.put(LibraryController());
  final ScrollController _scrollController = ScrollController();

  LibraryListPaginate({Key? key}) : super(key: key){
    libraryController.fetchLibraries();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // User has reached the end of the list, load more data
        libraryController.loadMore();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Library List'),
      ),
      body: Obx(() {
        if (libraryController.isLoading()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: libraryController.libraryList.length + 1, // Add one for the loading indicator
            itemBuilder: (context, index) {
              if (index == libraryController.libraryList.length) {
                // Show loading indicator when reaching the end of the list
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final library = libraryController.libraryList[index];
                return ListTile(
                  leading: Image.network(
                      "${Urls.apiServerBaseUrl}${library.logo_url ?? Endpoints.blankLibraryLogoUri}"),
                  title: Text(library.name ?? "" ),
                  subtitle: Text(
                      "${library.address?.policeStation.name}, ${library.address?.district.name}"),
                  // Display other properties as needed
                );
              }
            },
            controller: _scrollController,
          );
        }
      }),
    );
  }
}
