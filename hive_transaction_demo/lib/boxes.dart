import 'package:hive/hive.dart';
import 'package:hive_transaction_example/transaction.dart';

class Boxes{
  static Box<Transaction> getTransactions() => Hive.box<Transaction>("transactions");
}