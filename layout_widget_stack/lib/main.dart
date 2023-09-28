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
          title: const Text('Stack Widget Example'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: 200.0,
                height: 200.0,
                color: Colors.blue,
              ),
              Positioned(
                top: 50.0,
                left: 50.0,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.red,
                ),
              ),
              const Positioned(
                top: 100.0,
                left: 100.0,
                child: Text(
                  'Overlay Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}