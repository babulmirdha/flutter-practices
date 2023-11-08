import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details"),),
      body:  Center(child: TextButton(onPressed: (){
        Navigator.pop(context);
        // Navigator.pushNamed(context, '/');
      },
      child: Text("Back to Home"),
      ))
      ,
    );
  }
}
