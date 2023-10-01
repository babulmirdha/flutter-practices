import 'package:flutter/material.dart';

class OverflowBoxScreen extends StatelessWidget {
  const OverflowBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: OverflowBox(
        minWidth: 0.0,
        maxWidth: double.infinity,
        minHeight: 0.0,
        maxHeight: double.infinity,
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
      )
      ,
    );
  }
}
