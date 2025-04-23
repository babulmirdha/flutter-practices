import 'package:flutter/material.dart';

/// LimitedBox is a widget that imposes additional constraints
/// (like maxHeight or maxWidth) **only when its parent does not impose any**.
///
/// It is especially useful inside scrollable widgets (like ListView or
/// SingleChildScrollView) where children may otherwise try to grow
/// to infinite size due to a lack of constraints.

class LimitedBoxScreen extends StatelessWidget {
  const LimitedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox Example')),
      body: SingleChildScrollView(
        // Scroll view creates an unconstrained vertical environment
        child: Column(
          children: [
            Text('Without LimitedBox (unconstrained child):'),
            Container(
              color: Colors.red[100],
              child: Column(
                children: [
                  // This child has a fixed height, so it's fine
                  Container(
                    color: Colors.blue,
                    height: 400, // No issue, height is specified
                    width: double.infinity,
                    child: Text('I have a fixed height, no issue here'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Spacing between sections

            Text('With LimitedBox (maxHeight: 200):'),
            Container(
              color: Colors.green[100],
              child: LimitedBox(
                maxHeight: 200, // Constrains the child to a max of 200 pixels in height
                child: Container(
                  color: Colors.green,
                  height: 400, // This would try to be 400, but LimitedBox limits it to 200
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'LimitedBox limits my height to 200!',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
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
