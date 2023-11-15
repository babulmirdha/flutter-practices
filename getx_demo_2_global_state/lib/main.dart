import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class CounterController extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update();
  }
}

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
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
