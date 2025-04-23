import 'package:flutter/material.dart';

class IntrinsicWidthScreen extends StatelessWidget {
  const IntrinsicWidthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicWidth Example')),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Short'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('A much longer button text'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Medium length'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
