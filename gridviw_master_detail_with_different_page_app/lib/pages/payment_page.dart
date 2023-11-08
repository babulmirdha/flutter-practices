import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PaymentPage"),),
      body: const Center(child: Text("This is PaymentPage")),
    );
  }
}
