import 'package:flutter/material.dart';

class AspectRatioScreen extends StatelessWidget  {

  const AspectRatioScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.blueGrey,
        ),
      ),
    );
  }



}