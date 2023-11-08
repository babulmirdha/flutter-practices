
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_transaction_example/boxes.dart';

import 'transaction.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  List<Transaction> transactions = [];

  void addTransaction( String name, double amount, bool isExpense ){

    final transaction = Transaction()
      ..name = name
        ..amount = amount
        ..createdDate = DateTime.now()
    ..isExpense = isExpense;

  // setState(() {
  //   transactions.add(transaction);
  // });

   final box = Boxes.getTransactions();
   box.add(transaction);
   //box.put("my_key",transaction);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions"),),
      body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder:  (context, index){
            return const Text("Text");
          }

      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: TransactionDialog);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    Hive.box("transactions").close();
    super.dispose();
  }
}
