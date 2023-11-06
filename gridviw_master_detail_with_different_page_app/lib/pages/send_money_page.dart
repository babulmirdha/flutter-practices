import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMoneyPage extends StatelessWidget {

  const SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send Money"),),
      body: const Center(child: Text("This is Send Money")),
    );
  }
}
