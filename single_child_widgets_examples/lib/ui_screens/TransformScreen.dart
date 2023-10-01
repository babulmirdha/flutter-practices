import 'package:flutter/material.dart';
import 'dart:math';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body:Transform.rotate(
        angle: 3.14 / 4, // 45 degrees in radians
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      )
      ,
    );
  }
}
