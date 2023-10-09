import 'package:flutter/material.dart';

void main() {
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle onTap event here
                  print('Widget tapped!');
                },
                onTapDown: (TapDownDetails details) {
                  // Handle onTapDown event here
                  print('Pointer tapped down at ${details.globalPosition}');
                },
                onTapUp: (TapUpDetails details) {
                  // Handle onTapUp event here
                  print('Pointer tapped up at ${details.globalPosition}');
                },
                onDoubleTap: () {
                  // Handle onDoubleTap event here
                  print('Widget double tapped!');
                },
                onLongPress: () {
                  // Handle onLongPress event here
                  print('Widget long pressed!');
                },
                onTapCancel: () {
                  // Handle onTapCancel event here
                  print('Tap gesture canceled');
                },
                child: Container(
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Tap Me!'),
                  ),
                ),
              ),
              GestureDetector(
                onVerticalDragStart: (DragStartDetails details) {
                  // Handle onVerticalDragStart event here
                  print('Vertical drag started at ${details.globalPosition}');
                },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  // Handle onVerticalDragUpdate event here
                  print('Vertical drag updated. Delta: ${details.primaryDelta}');
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  // Handle onVerticalDragEnd event here
                  if (details.primaryVelocity! > 0) {
                    print(
                        'Vertical drag ended with positive velocity (downward motion).');
                  } else if (details.primaryVelocity! < 0) {
                    print(
                        'Vertical drag ended with negative velocity (upward motion).');
                  } else {
                    print('Vertical drag ended with zero velocity.');
                  }
                },
                child: Container(
                  height: 200,
                  color: Colors.amberAccent,
                  child: const Center(
                    child: Text('Drag Me Vertically!'),
                  ),
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: (DragStartDetails details) {
                  // Handle onHorizontalDragStart event here
                  print('Horizontal drag started at ${details.globalPosition}');
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  // Handle onHorizontalDragUpdate event here
                  print(
                      'Horizontal drag updated. Delta: ${details.primaryDelta}');
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  // Handle onHorizontalDragEnd event here
                  if (details.primaryVelocity !> 0) {
                    print(
                        'Horizontal drag ended with positive velocity (rightward motion).');
                  } else if (details.primaryVelocity! < 0) {
                    print(
                        'Horizontal drag ended with negative velocity (leftward motion).');
                  } else {
                    print('Horizontal drag ended with zero velocity.');
                  }
                },
                child: Container(
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Drag Me Horizontally!'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
