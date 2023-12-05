import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String heroTag;

  const DetailPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
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