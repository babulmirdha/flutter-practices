import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Numbers App',
      home: AddNumbersScreen(),
    );
  }
}

class AddNumbersScreen extends StatefulWidget {
  @override
  _AddNumbersScreenState createState() => _AddNumbersScreenState();
}

class _AddNumbersScreenState extends State<AddNumbersScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  int result = 0;

  void _addNumbers() {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Numbers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Number 1'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNumbers,
              child: Text('Add'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
