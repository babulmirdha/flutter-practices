import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final String tagName;

  const UserDetailsPage({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Hero(
          tag: tagName,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/babulmirdha.png"),
                  const Text("Md Babul Mirdha")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}