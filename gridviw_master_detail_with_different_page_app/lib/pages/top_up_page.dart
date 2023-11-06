import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top Up"),),
      body: const Center(child: Text("This is TopUp")),
    );
  }
}
