import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hands_on_demo/blocs/counter_controller.dart';

class NextPage extends StatelessWidget {

  CounterController controller = Get.find<CounterController>();

   NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${controller.counter}") ,
      ),
    );
  }
}
