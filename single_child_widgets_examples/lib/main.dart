import 'package:flutter/material.dart';

import 'MyDrawer.dart';

void main() {
  runApp(const MyApp());
}

SingleChildScrollView buildSingleChildScrollView() {
  return const SingleChildScrollView(
    child: Column(
      children: [

      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Single child widgets examples")),
        drawer: const MyDrawer(), // Add the custom drawer here
        body: buildSingleChildScrollView(),
      ),
    );
  }
}
