import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample data
  final List<String> dataList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recurring Widgets Example'),
        ),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            // Use the data from the list to create a widget
            return ListTile(
              title: Text(dataList[index]),
            );
          },
        ),
      ),
    );
  }
}
