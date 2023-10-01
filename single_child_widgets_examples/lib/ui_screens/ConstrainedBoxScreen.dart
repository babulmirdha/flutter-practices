import 'package:flutter/material.dart';

class ConstrainedBoxScreen extends StatelessWidget  {


  const ConstrainedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:   ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 50,
          maxWidth: 300,
          maxHeight: 100,
        ),
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }



}