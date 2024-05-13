import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

// Define state
class CounterState {
  final int count;

  CounterState(this.count);
}

// Define Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.count + 1);
    }
  }
}

// Define Widget
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Count:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${state.count}',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(IncrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: MaterialApp(
        title: 'Bloc Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterWidget(),
      ),
    ),
  );
}
