import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coloumn Example"),),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 100,
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
            height: 100,
            child: Center(child: Text('Widget 3')),
          ),
        ],
      ),
    );
  }
}
