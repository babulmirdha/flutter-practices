import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_image_example/models/person.dart';
import 'pages/person_page.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
 await Hive.openBox<Person>("persons");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Example',
      home: PersonPage(),
    );
  }
}


