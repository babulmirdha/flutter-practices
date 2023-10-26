
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'transaction.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions"),),
    );
  }

  @override
  void dispose() {
    Hive.box("transactions").close();
    super.dispose();
  }
}
