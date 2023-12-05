import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String tagName;

  const DetailsPage({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: Hero(
          tag: tagName,
          child: Container(
            color: Colors.blue,
            height: 300.0,
            width: 300.0,
          ),
        ),
      ),
    );
  }
}