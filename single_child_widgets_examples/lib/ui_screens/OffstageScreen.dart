import 'package:flutter/material.dart';

class OffstageScreen extends StatelessWidget {
  const OffstageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: const Offstage(
        offstage: false,
        // a boolean variable indicating whether to hide the child or not
        child: Text('This is offstage'),
      ),
    );
  }
}
