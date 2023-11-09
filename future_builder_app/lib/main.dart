import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Future<String> fetchData() async {


    await Future.delayed(Duration(seconds: 2)); // Simulating a time-consuming operation

    return "Data loaded successfully!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder Example'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press the button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return Text('Result: ${snapshot.data}');

              }
            },
          ),
        ),
      ),
    );
  }
}
