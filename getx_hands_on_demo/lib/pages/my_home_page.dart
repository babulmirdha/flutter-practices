
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hands_on_demo/blocs/calculator_controller.dart';
import 'package:getx_hands_on_demo/blocs/counter_controller.dart';
import 'package:getx_hands_on_demo/pages/next_page.dart';

class MyHomePage extends GetView<CounterController> {

  // CounterController counterController =   Get.put(CounterController());
  // CalculatorController calculatorController =   Get.find<CalculatorController>();


  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("GetX Demo"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(()=>Text(
                '${controller.counter}'
            )),

          TextButton(onPressed: () => Get.toNamed("/next_page") , child: Text("Click to go to Next Page")),
         
          // Obx(() => Text("${calculatorController.result}")),
          // TextButton(onPressed: () => calculatorController.add(5, 3)  , child: Text("Add 5+3"))



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
