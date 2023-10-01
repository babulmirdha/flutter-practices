import 'package:flutter/material.dart';

class PaddingScreen extends StatelessWidget  {

  const PaddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            // Adds 16 logical pixels padding to all sides
            child: Text("Padding:EdgeInsets.all"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            // Adds 16 logical pixels padding to all sides
            child: Text("Padding: EdgeInsets.only"),
          ),
        ],
      ),
    );
  }



}