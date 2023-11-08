import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final PanGestureRecognizer _panGestureRecognizer = PanGestureRecognizer();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _panGestureRecognizer.onStart = (DragStartDetails details) {
     // Handle onPanStart event here
      print('Pan started at ${details.globalPosition}');
    };

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
        body: GestureDetector(
          onPanStart: (DragStartDetails details) {
            print("onPanStart: ${details.localPosition}");
            // _panGestureRecognizer.onStart(details);
          },
          onPanUpdate: (DragUpdateDetails details) {
            print("onPanUpdate: ${details.localPosition}");
            // _panGestureRecognizer?.onUpdate(details);
          },
          onPanEnd: (DragEndDetails details) {
            print("onPanEnd: ${details.primaryVelocity}");
            // _panGestureRecognizer?.onEnd(details);
          },
          child: Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Pan Me!'),
            ),
          ),
        ),
      ),
    );
  }
}
