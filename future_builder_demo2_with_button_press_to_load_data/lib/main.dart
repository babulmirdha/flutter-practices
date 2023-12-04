import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder Example'),
        ),
        body: MyFutureBuilder(),
      ),
    );
  }
}

class MyFutureBuilder extends StatefulWidget {
  @override
  _MyFutureBuilderState createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    // Initialize the future in the initState
    _future = fetchData();
  }

  // Simulate an asynchronous operation
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    // For example, this might be where you fetch data from an API
    return 'Data loaded successfully!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: FutureBuilder<String>(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press the button to load data.');
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data: ${snapshot.data}');
                  }
                default:
                  return Text('Default case');
              }
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // Trigger the asynchronous operation when the button is pressed
              _future = fetchData();
            });
          },
          child: Text('Load Data'),
        ),
      ],
    );
  }
}
