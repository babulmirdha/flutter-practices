import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Widget Example'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
                child: const Center(child: Text("1")),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                color: Colors.green,
                child: const Center(child: Text("2")),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                color: Colors.blue,
                child: const Center(child: Text("3")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
