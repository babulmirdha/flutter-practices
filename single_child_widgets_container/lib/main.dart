import 'package:flutter/material.dart';

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
      home: const MyButton(),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Title")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 10.0, color: Colors.white),
              left: BorderSide(width: 10.0, color: Colors.white),
              right: BorderSide(width: 10.0, color: Colors.white),
              bottom: BorderSide(width: 10.0, color: Colors.white),
            ),
            color: Colors.grey,
          ),
          child: const Text('OK',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
