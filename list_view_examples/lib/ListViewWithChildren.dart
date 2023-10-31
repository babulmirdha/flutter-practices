import 'package:flutter/material.dart';

class ListViewWithChildren extends StatelessWidget {
  const ListViewWithChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      ListView(children: [
        Text("item #1"),
        Text("item #2"),
        Text("item #3"),
        ListTile(title: Text( "Item title #1"), subtitle: Text("Item sub title #1"),),
        ListTile(title: Text( "Item title #2"), subtitle: Text("Item sub title #2"),),

      ],),
    );
  }
}
