import 'package:flutter/material.dart';

import 'SongScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SongScreen(),
              ),
            );
          },
          child: const Text("Click me"),
        ),
      ),
    );
  }
}
