import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_example/Travel.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


late Future<Database> database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Hive.initFlutter();
  // var box = await Hive.openBox('testBox');

  // Open the database and store the reference.
   database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'travel_database.db'),
    // When the database is first created, create a table to store travels.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE travels(id INTEGER PRIMARY KEY autoincrement, name TEXT, picture BLOB)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  File? image;

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


  // A method that retrieves all the travels from the travels table.
  Future<List<Travel>> travels() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The travels.
    final List<Map<String, dynamic>> maps = await db.query('travels');

    // Convert the List<Map<String, dynamic> into a List<travel>.
    return List.generate(maps.length, (i) {
      return Travel(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        picture: maps[i]["picture"]
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async{
                try {
                  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if(image == null) return;
                  final imageTemp = File(image.path);
                  setState(() => this.image = imageTemp);
                } on PlatformException catch(e) {
                  print('Failed to pick image: $e');
                }
              },
              child: image==null?
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green
                ),
              ):Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green
                ),
                child: Image.file(image!),
              ),
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Any Value",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){


              print("clicked");


              var data  = image?.readAsBytesSync();

              var travel = Travel( name: controller.text.trim(), picture:data );

              insertTravel(travel);

             print(travels()) ;

            Future<List<Travel>> list = travels();


            list.then((value) {

              value.forEach((element) {

                print(element.name);
              });

            });


            }, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}

