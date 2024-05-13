import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CounterController.dart';


class SecondPage extends StatelessWidget {
  final CounterController ctrl = Get.find<CounterController>();

  SecondPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(child: Text("${ctrl.count}")));
  }
}