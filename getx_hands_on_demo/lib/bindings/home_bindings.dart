import 'package:get/get.dart';
import 'package:getx_hands_on_demo/blocs/calculator_controller.dart';

import '../blocs/counter_controller.dart';

class HomeBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }

}