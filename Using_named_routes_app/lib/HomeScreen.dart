
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body:
       Center(
         child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
          child: const Text("Click me to go details"),
      ),
       )
      ,
    );
  }


}
