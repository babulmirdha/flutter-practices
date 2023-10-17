import 'package:flutter/cupertino.dart';
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar( title: Text("FlutterBatch 02") ),
          body: Center(child: Column(
            children: [
              Text("Hello Batch 02"),
              SizedBox(height: 50),
              Image.asset("images/bm.png"),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Md Babul Mirdha"))
            ],
          ))
      ) ,
    );
  }
}
