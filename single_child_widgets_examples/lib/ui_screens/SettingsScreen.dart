import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {


  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: const Center(
        child: Text('This is the Settings Screen'),
      ),
    );
  }
}