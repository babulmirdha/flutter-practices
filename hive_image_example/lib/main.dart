import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_image_example/person.dart';
import 'person_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
 await Hive.openBox<Person>("persons");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Example',
      home: PersonPage(),
    );
  }
}


