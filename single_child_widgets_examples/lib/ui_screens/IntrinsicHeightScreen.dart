import 'package:flutter/material.dart';

class IntrinsicHeightScreen extends StatelessWidget  {


  const IntrinsicHeightScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:       IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(width: 50, height: 100, color: Colors.blue),
            Container(width: 150, height: 50, color: Colors.green),
          ],
        ),
      )
      ,
    );
  }



}