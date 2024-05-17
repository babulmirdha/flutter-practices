import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'Travel.dart'; // Adjust the import to the correct path
import 'main.dart'; // Adjust the import to the correct path

class EditTravelPage extends StatefulWidget {
  final Travel travel;

  const EditTravelPage({required this.travel});

  @override
  State<EditTravelPage> createState() => _EditTravelPageState();
}

class _EditTravelPageState extends State<EditTravelPage> {
  final TextEditingController controller = TextEditingController();
  File? image;
  Uint8List? initialImage;

  @override
  void initState() {
    super.initState();
    controller.text = widget.travel.name;
    initialImage = widget.travel.picture;
  }

  // Define a function that updates the travel in the database
  Future<void> updateTravel() async {
    final db = await database;
    final travel = Travel(
      id: widget.travel.id,
      name: controller.text.trim(),
      picture: image?.readAsBytesSync() ?? initialImage,
    );

    // Update existing travel
    await db.update(
      'travels',
      travel.toMap(),
      where: 'id = ?',
      whereArgs: [travel.id],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Travel")),
      body: Center(
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
                  setState(() => this.image = newImage);
                } on PlatformException catch (e) {
                  print('Failed to pick image: $e');
                }
              },
              child: image == null && initialImage == null
                  ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green),
              )
                  : Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green),
                child: image != null
                    ? Image.file(image!)
                    : initialImage != null
                    ? Image.memory(initialImage!)
                    : null,
              ),
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Any Value",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                await updateTravel();
                Navigator.pop(context, true); // Signal that the travel was updated
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
