import 'package:flutter/material.dart';

import 'CustomSingleChildLayoutWidget.dart';

class CustomSingleChildLayoutScreen extends StatelessWidget  {

  const CustomSingleChildLayoutScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:  CustomSingleChildLayout(
        delegate: CustomSingleChildLayoutWidget(),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Custom Layout',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

}