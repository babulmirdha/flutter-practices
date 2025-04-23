import 'package:flutter/material.dart';

class AlignScreen extends StatelessWidget  {



  const AlignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 200,
            // Sets the background color to blue
            child: Align(
              alignment: Alignment.center,
              // Aligns the child widget to the top-right corner
              child: Text("Align: Alignment.topRight"),
            ),
          ),
          Container(
            color: Colors.green,
            height: 300,
            child: const Align(
              alignment: FractionalOffset(0.2, 0.33),
              // Aligns the child widget 50% from the left and 80% from the top

              child: Text("Align: FractionalOffset"),
            ),
          ),
        ],
      ),
    );
  }



}