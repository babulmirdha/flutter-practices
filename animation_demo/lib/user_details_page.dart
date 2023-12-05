import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final String heroTag;

  UserDetailsPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/babulmirdha.png"),
                  Text("Md Babul Mirdha")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}