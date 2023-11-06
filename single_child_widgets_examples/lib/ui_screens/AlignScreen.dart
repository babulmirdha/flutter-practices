import 'package:flutter/material.dart';

class AlignScreen extends StatelessWidget  {



  const AlignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: const Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            // Aligns the child widget to the top-right corner
            child: Text("Align: Alignment.topRight"),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.8),
            // Aligns the child widget 50% from the left and 80% from the top

            child: Text("Align: FractionalOffset"),
          ),
        ],
      ),
    );
  }



}