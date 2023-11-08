import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashOutPage extends StatelessWidget {
  const CashOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cash out"),),
      body: const Center(child: Text("This is cashout page")),
    );
  }
}
