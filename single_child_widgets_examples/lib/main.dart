import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Single child widgets examples")),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                // Adds 16 logical pixels padding to all sides
                child: Text("Padding:EdgeInsets.all"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                // Adds 16 logical pixels padding to all sides
                child: Text("Padding: EdgeInsets.only"),
              ),
              const Align(
                alignment: Alignment.topRight, // Aligns the child widget to the top-right corner
                child: Text("Align: Alignment.topRight"),
              ),
              const Align(
                alignment: FractionalOffset(0.5, 0.8), // Aligns the child widget 50% from the left and 80% from the top

                child: Text("Align: FractionalOffset"),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('assets/bm.png'),
              ),
              AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  minHeight: 50,
                  maxWidth: 200,
                  maxHeight: 100,
                ),
                child: Container(
                  color: Colors.red,
                ),
              ),
              const Baseline(
                baseline: 50,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Baseline',
                  style: TextStyle(fontSize: 30),
                ),
              ),FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.3,
                child: Container(
                  color: Colors.green,
                ),
              )





            ],
          ),
        ),
      ),
    );
  }
}
