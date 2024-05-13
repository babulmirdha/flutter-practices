import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define a simple model class to represent the state
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify listeners that the state has changed
  }
}

// Define a widget that uses the Provider to access the state
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the CounterModel instance using Provider
    final counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${counter.count}', // Display the current count
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the increment method on the CounterModel instance
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(
    // Wrap the root widget of your application with a Provider
    // Here, we're using ChangeNotifierProvider to provide a CounterModel instance
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        title: 'Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterWidget(),
      ),
    ),
  );
}
