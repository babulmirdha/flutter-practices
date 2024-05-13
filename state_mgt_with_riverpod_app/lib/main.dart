import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';


// Create a provider for the counter
final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Riverpod Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the provider to get the counter value and update it
    final counter = useProvider(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
            ),
            Text(
              '${counter.state}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider).state++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
