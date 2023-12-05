import 'package:flutter/material.dart';

import 'custom_animation_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomAnimationWidget(),
    );
  }
}
