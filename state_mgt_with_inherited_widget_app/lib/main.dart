import 'package:flutter/material.dart';

// Define a custom InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  final int data;

  MyInheritedWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}

// Define a widget that uses the InheritedWidget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the data from the nearest MyInheritedWidget ancestor
    final inheritedData = MyInheritedWidget.of(context)?.data ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Example'),
      ),
      body: Center(
        child: Text('Data from InheritedWidget: $inheritedData'),
      ),
    );
  }
}

// Define the main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: 42, // Data to be shared across the widget tree
      child: MaterialApp(
        title: 'InheritedWidget Example',
        home: MyWidget(),
      ),
    );
  }
}

// Run the app
void main() {
  runApp(MyApp());
}
