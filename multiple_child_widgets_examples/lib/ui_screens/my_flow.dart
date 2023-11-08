import 'package:flutter/material.dart';


class MyFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      var childSize = context.getChildSize(i);
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0.0),
      );
      x += childSize!.width + 10; // Add some spacing between children
      if (x + childSize.width > context.size.width) {
        // Move to the next row if the child overflows the width
        x = 0;
        y += childSize.height + 10; // Add some spacing between rows
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}

class MyFlow extends StatelessWidget {
  const MyFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Delegate Example'),
      ),
      body: Flow(
        delegate: MyFlowDelegate(),
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.yellow,
            width: 90,
            height: 90,
          ),
          Container(
            color: Colors.orange,
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }
}