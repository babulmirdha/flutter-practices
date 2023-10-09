import 'package:flutter/material.dart';

class IntrinsicWidthScreen extends StatelessWidget  {

  const IntrinsicWidthScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:    IntrinsicWidth(
        child: Column(
          children: <Widget>[
            Container(width: 50, height: 100, color: Colors.blue),
            Container(width: 150, height: 50, color: Colors.green),
            Container(width: 100, height: 70, color: Colors.red),
          ],
        ),
      )

      ,
    );
  }

}