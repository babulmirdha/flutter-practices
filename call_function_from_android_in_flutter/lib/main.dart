import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('your_channel_name');
  String result = '';

  Future<void> callKotlinFunction() async {
    try {
      final String kotlinResult =
      await platform.invokeMethod('your_kotlin_function');
      setState(() {
        result = kotlinResult;
      });
    } on PlatformException catch (e) {
      setState(() {
        result = 'Error calling Kotlin function: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Kotlin Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: callKotlinFunction,
              child: Text('Call Kotlin Function'),
            ),
            SizedBox(height: 20),
            Text('Result from Kotlin: $result'),
          ],
        ),
      ),
    );
  }
}
