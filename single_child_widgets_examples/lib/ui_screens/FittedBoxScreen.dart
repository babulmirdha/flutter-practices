import 'package:flutter/material.dart';

class FittedBoxScreen extends StatelessWidget  {



  const FittedBoxScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:       FittedBox(
        fit: BoxFit.fitWidth,
        child: Image.asset('assets/bm.png'),
      ),
    );
  }



}