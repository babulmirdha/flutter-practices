import 'package:flutter/material.dart';

class FractionallySizedBoxScreen extends StatelessWidget  {

  const FractionallySizedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: FractionallySizedBox(
        widthFactor: 1, // 100% width of the screen
        heightFactor: 0.5, // 50% height of the screen
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }



}