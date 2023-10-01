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
        widthFactor: 0.5,
        heightFactor: 0.3,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }



}