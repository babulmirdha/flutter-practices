import 'dart:async';
import 'package:flutter/material.dart';

// Define events
enum CounterEvent { increment }

// Define Bloc
class CounterBloc {
  int _counter = 0;
  final _counterController = StreamController<int>();

  // Inputs
  StreamSink<int> get _inCounter => _counterController.sink;

  // Outputs
  Stream<int> get counter => _counterController.stream;

  // Event handler
  void mapEventToState(CounterEvent event) {
    if (event == CounterEvent.increment) {
      _counter++;
      _inCounter.add(_counter);
    }
  }

  // Clean up
  void dispose() {
    _counterController.close();
  }
}

// Define Widget
class CounterWidget extends StatelessWidget {
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Count:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.mapEventToState(CounterEvent.increment);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    // super.dispose();
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Bloc Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    ),
  );
}
