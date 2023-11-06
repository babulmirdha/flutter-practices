import 'package:flutter/material.dart';

class SizedBoxScreen extends StatelessWidget {
  const SizedBoxScreen({super.key});

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
            const SizedBox(
              height: 20, // Adds a vertical spacing of 20 pixels
            ),
            SizedBox(
              width: 150, // Adds a horizontal spacing of 150 pixels
              height: 150, // Adds a vertical spacing of 150 pixels
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'SizedBox with fixed size',
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
