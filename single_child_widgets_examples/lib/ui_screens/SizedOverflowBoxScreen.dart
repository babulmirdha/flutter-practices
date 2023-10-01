import 'package:flutter/material.dart';

class SizedOverflowBoxScreen extends StatelessWidget {
  const SizedOverflowBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body:SizedOverflowBox(
        size: const Size(200, 200),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
