import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: Colors.blue),
          ),
          Expanded(
            child: Container(color: Colors.green),
          ),
          Expanded(
            child: Container(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
