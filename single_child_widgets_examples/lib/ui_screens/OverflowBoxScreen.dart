import 'package:flutter/material.dart';

class OverflowBoxScreen extends StatelessWidget {
  const OverflowBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      // body: OverflowBox(
      //   minWidth: 0.0,
      //   maxWidth: double.infinity,
      //   minHeight: 0.0,
      //   maxHeight: double.infinity,
      //   child: Container(
      //     width: 300,
      //     height: 300,
      //     color: Colors.blue,
      //   ),
      // ),

     body: Center(
        child: Container(
          width: 200, // Set a fixed width for the parent container
          height: 200, // Set a fixed height for the parent container
          color: Colors.blue,
          child: OverflowBox(
            maxWidth: 300, // Set the maximum width for the child to overflow
            maxHeight: 300, // Set the maximum height for the child to overflow
            child: Container(
              width: 250, // This width will overflow the constraints set by OverflowBox
              height: 250, // This height will overflow the constraints set by OverflowBox
              color: Colors.red,
              child: const Center(
                child: Text(
                  'OverflowBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
