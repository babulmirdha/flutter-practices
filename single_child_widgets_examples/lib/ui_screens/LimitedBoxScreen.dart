import 'package:flutter/material.dart';

class LimitedBoxScreen extends StatelessWidget {
  const LimitedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: LimitedBox(
        maxWidth: 200,
        maxHeight: 150,
        child: Container(
          color: Colors.orange,
        ),
      ),
    );
  }
}
