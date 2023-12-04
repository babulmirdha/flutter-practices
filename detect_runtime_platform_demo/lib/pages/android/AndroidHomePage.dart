import 'package:flutter/material.dart';

class AndroidHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Home Page'),
      ),
      body: Center(
        child: Text('Welcome to Android App!'),
      ),
    );
  }
}