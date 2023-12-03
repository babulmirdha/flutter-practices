import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LastKnownLocationPage extends StatefulWidget {
  const LastKnownLocationPage({super.key});


  @override
  State<LastKnownLocationPage> createState() => _LastKnownLocationPageState();
}

class _LastKnownLocationPageState extends State<LastKnownLocationPage> {


  @override
  void initState() {
    super.initState();
  }

  Future<String> _getLastKnownPosition() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.whileInUse) {
        Position? position = await Geolocator.getLastKnownPosition();;

       return  'Last Known Location:\n Lat: ${position?.latitude}, Lon: ${position?.longitude}';

      } else {
        // Handle the case where the user denied or didn't grant the location permission
      }
    } catch (e) {
      // Handle exceptions, if any
      print(e.toString());
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Last Known Location"),
      ),
      body: Center(
        // Using FutureBuilder to handle asynchronous operations
        child: FutureBuilder<String>(
          // The future to wait for
          future: _getLastKnownPosition(),
          // Builder function with three parameters:
          // context: the build context
          // snapshot: the latest result of the future
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              // If the future is not yet requested or in progress
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
              // If the future is still in progress
                return CircularProgressIndicator();
              case ConnectionState.done:
              // If the future is completed
                if (snapshot.hasError) {
                  // If an error occurred during the future execution
                  return Text('Error: ${snapshot.error}');
                } else {
                  // If the future completed successfully
                  return Text('${snapshot.data}');
                }
            }
          },
        ),
      ),
    );
  }
}