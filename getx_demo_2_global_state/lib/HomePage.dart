
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CounterController.dart';
import 'SecondPage.dart';


class HomePage extends StatelessWidget {
  final controller = Get.put(CounterController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
                builder: (_) => Text(
                  'clicks: ${controller.count}',
                )),
            ElevatedButton(
              child: const Text('Next Route'),
              onPressed: () {
                Get.to(SecondPage());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
