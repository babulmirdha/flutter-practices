import 'package:flutter/material.dart';

class BaselineScreen extends StatelessWidget  {


  const BaselineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:  const Baseline(
        baseline: 50,
        baselineType: TextBaseline.alphabetic,
        child: Text(
          'Baseline',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }



}