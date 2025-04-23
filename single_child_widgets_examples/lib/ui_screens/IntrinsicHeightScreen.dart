import 'package:flutter/material.dart';

class IntrinsicHeightScreen extends StatelessWidget {
  const IntrinsicHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IntrinsicHeight Example"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blue,
              width: 100,
                height: 200,
                child: const Center(
                  child: Text(
                    'Short',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
                width: 20,
              ),
              Container(
                color: Colors.green,
                width: 200,
                height: 150,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This one has more text',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'So it is taller',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
