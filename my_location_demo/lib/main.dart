import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_location_demo/master_page.dart';

import 'my_current_position_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MasterPage(),
    );
  }
}


