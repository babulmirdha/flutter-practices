import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_example/Travel.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'main.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CreateTravelPage extends StatefulWidget {
  const CreateTravelPage({Key? key});

  @override
  State<CreateTravelPage> createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  final TextEditingController controller = TextEditingController();
  File? imageFile;

  // Define a function that inserts travels into the database
  Future<void> insertTravel(Travel travel) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the travel into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same travel is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'travels',
      travel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Function to resize the image
  Future<Uint8List?> resizeImage(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 1024,
      minHeight: 1024,
      quality: 85,
    );
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Travel"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              if (controller.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a travel name')),
                );
                return;
              }

              if (imageFile == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select an image')),
                );
                return;
              }

              var data = imageFile!.readAsBytesSync();
              var travel = Travel(name: controller.text.trim(), picture: data);
              await insertTravel(travel);

              Navigator.pop(context, true);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                try {
                  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedImage == null) return;
                  final newImage = File(pickedImage.path);
                  setState(() => this.imageFile = newImage);
                } on PlatformException catch (e) {
                  print('Failed to pick image: $e');
                }
              },
              child: Hero(
                tag: 'selected_image',
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: imageFile != null ? null : Colors.green,
                  ),
                  child: imageFile != null
                      ? Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.camera_alt, size: 50),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Any Value",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
