import 'package:flutter/material.dart';
import 'package:multiple_child_widgets_examples/menu_items.dart';

import 'MyDrawer.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var listWidgets = <Widget>[];

    for(var widget in widgetList){
      listWidgets.add(ListTile(
        title: Text(widget.runtimeType.toString()),
          onTap: () {

          }
      ));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Multiple child widgets examples")),
        drawer: const MyDrawer(), // Add the custom drawer here
        body: ListView(
          children: listWidgets,
        ),
      ),
    );
  }
}

