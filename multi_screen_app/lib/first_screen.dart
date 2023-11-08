import 'package:flutter/material.dart';
import 'package:multi_screen_app/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: TextButton(
        onPressed: () {
          Navigator.push( context, MaterialPageRoute(builder: (context) => SecondScreen()), );
        },
        child: Text("Click me to go to Second Screen"),
      )),
    );
  }
}
