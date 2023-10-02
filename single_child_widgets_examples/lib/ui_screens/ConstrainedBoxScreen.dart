import 'package:flutter/material.dart';

import 'MyCustomIconPainter.dart';

class ConstrainedBoxScreen extends StatelessWidget  {


  const ConstrainedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:   Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 50,
              maxWidth: 300,
              maxHeight: 100,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(
          //     aspectRatio: 16 / 9,
          //   ),
          //   child: Container(
          //     color: Colors.red,
          //   ),
          // )
          // ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (context, index) {
          //     return ConstrainedBox(
          //       constraints: const BoxConstraints(
          //         minHeight: 50.0,
          //       ),
          //       child: Text("item : $index"),
          //     );
          //   },
          // )

          // ConstrainedBox(
          //   constraints: const BoxConstraints.expand(),
          //   child: CustomPaint(
          //     painter: MyCustomIconPainter(),
          //   ),
          // )

        ],
      ),
    );
  }



}