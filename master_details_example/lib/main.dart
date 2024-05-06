import 'package:flutter/material.dart';

import 'DetailWidget.dart';
import 'MasterListWidget.dart';
import 'item.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  final List<Item> items = [
    Item('Item 1', 'Description for Item 1'),
    Item('Item 2', 'Description for Item 2'),
    Item('Item 3', 'Description for Item 3'),
  ];

  void _onItemSelected(Item item, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailWidget(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master-Detail Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Master-Detail Example'),
        ),
        body: MasterListWidget(items: items, onItemSelected: _onItemSelected),
      ),
    );
  }
}
