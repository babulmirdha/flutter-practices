import 'package:flutter/material.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'CreateTravelPage.dart';
import 'TravelListPage.dart';
import 'TravelListWithCRUDPage.dart';

late Future<Database> database;

void main() {
   WidgetsFlutterBinding.ensureInitialized();

   initDb();

  runApp(const MyApp());
}

Future<void> initDb() async {

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
      home: const TravelListWithCRUDPage(),
    );
  }
}
