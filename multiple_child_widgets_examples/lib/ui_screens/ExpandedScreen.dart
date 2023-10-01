import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.red),
          ),
          Expanded(
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
