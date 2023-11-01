import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row Example"),),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: 100,
            child: Center(child: Text('Widget 1')),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Center(child: Text('Widget 2 - Expanded')),
            ),
          ),
          Container(
            color: Colors.red,
            width: 100,
            child: Center(child: Text('Widget 3')),
          ),
        ],
      ),
    );
  }
}
