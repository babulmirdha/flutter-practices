import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'MyButton.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}


class ButtonDelegate2 extends ButtonDelegate{

  @override
  void onPressed() {
    Fluttertoast.showToast(
        msg: "Button Click 2",
        toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be displayed
        gravity: ToastGravity.BOTTOM, // Position of the toast message on the screen
        timeInSecForIosWeb: 1, // Time duration for iOS and web platforms
        backgroundColor: Colors.black, // Background color of the toast message
        textColor: Colors.white, // Text color of the toast message
        fontSize: 16.0 // Font size of the toast message text
    );
  }
}

class MyHomePage extends StatelessWidget implements ButtonDelegate {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Usage
    // var buttonDelegate = ButtonDelegate();


    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          MyButton(this, text: "Click me",),
          MyButton(ButtonDelegate2(), text: "Click me",),
        ],
      ),
    );
  }

  @override
  void onPressed() {
    Fluttertoast.showToast(
        msg: "Button Clicked 1",
        toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be displayed
        gravity: ToastGravity.BOTTOM, // Position of the toast message on the screen
        timeInSecForIosWeb: 1, // Time duration for iOS and web platforms
        backgroundColor: Colors.black, // Background color of the toast message
        textColor: Colors.white, // Text color of the toast message
        fontSize: 16.0 // Font size of the toast message text
    );
  }


}
