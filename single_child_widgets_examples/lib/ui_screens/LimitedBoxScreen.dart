import 'package:flutter/material.dart';

class LimitedBoxScreen extends StatelessWidget {
  const LimitedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Center(
        child: LimitedBox(
          maxWidth: 200, // Set maximum width
          maxHeight: 200, // Set maximum height
          child: Container(
            color: Colors.blue,
            width: 250, // This width exceeds the maxWidth set by LimitedBox
            height: 250, // This height exceeds the maxHeight set by LimitedBox
            child: const Center(
              child: Text(
                'LimitedBox Example',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
