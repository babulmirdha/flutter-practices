import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Column(
        children: <Widget>[
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
