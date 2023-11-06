import 'package:flutter/material.dart';

class SizedOverflowBoxScreen extends StatelessWidget {
  const SizedOverflowBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 100,
              width: 200,
              child: const Center(
                child: Text(
                  'Container with fixed size',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Adds vertical spacing of 20 pixels
            SizedOverflowBox(
              size: const Size(150, 150), // Specifies the maximum size of the child
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'SizedOverflowBox with fixed size and overflow content',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
