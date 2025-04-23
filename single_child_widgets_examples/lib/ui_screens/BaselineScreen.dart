import 'package:flutter/material.dart';

import 'MyCustomIconPainter.dart';

class BaselineScreen extends StatelessWidget  {


  const BaselineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:
         SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: <Widget>[
                  Baseline(
                    baseline: 80,
                    baselineType: TextBaseline.alphabetic,
                    child: Icon(Icons.star, size: 40),
                  ),
                  // Icon(Icons.star, size: 40),
                  Text('Star'),
                ],
              ),

              Row(
                children: <Widget>[
                  Image.asset('assets/bm.png', height: 80),
                  const Baseline(
                    baseline: 30,
                    baselineType: TextBaseline.alphabetic,
                    child: Text('Image Caption'),
                  ),
                ],
              ),
               Row(
                children: <Widget>[
                  CustomPaint(
                    size: const Size(200, 200),
                   painter: MyCustomIconPainter(),
                  ),
                  const Baseline(
                    baseline: 40,
                    baselineType: TextBaseline.alphabetic,
                    child: Text('Custom Icon'),
                  ),
                ],
              ),
              const Column(
                children: <Widget>[
                  Row(
                    children: [
                      Baseline(
                        baseline: 20,
                        baselineType: TextBaseline.alphabetic,
                        child: Text('Text 1'),
                      ),
                      Baseline(
                        baseline: 30,
                        baselineType: TextBaseline.alphabetic,
                        child: Text('Text 2'),
                      ),
                    ],
                  )

                ],
              )
            ],
          ),
        )

      // const Baseline(
      //   baseline: 50,
      //   baselineType: TextBaseline.alphabetic,
      //   child: Text(
      //     'Baseline',
      //     style: TextStyle(fontSize: 14),
      //   ),
      // ),
    );
  }



}