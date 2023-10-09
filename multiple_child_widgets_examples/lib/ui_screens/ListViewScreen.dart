import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            subtitle: Text('This is map'),
            iconColor: Colors.blue,
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Album'),
            subtitle: Text('This is Album'),
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
            subtitle: Text('This is Camera'),
          )
          // Add more list items here
        ],
      ),
    );
  }
}
