import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<CounterPageState> _counterKey = GlobalKey();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GlobalKey Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CounterPage(
                key: _counterKey,
              ),
              ElevatedButton(
                onPressed: () {
                  _counterKey.currentState?.increment(); // Accessing the CounterState and calling its method
                },
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {

  const CounterPage({Key? key}) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {

  int _count = 0;

  void increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Counter: $_count',
      style: const TextStyle(fontSize: 24),
    );
  }
}
