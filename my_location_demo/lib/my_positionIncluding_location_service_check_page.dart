
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyPositionIncludingLocationSerciceCheckPage extends StatefulWidget {

  const MyPositionIncludingLocationSerciceCheckPage({super.key});

  @override
  State<MyPositionIncludingLocationSerciceCheckPage> createState() => _MyPositionIncludingLocationServiceCheckPageState();
}

class _MyPositionIncludingLocationServiceCheckPageState extends State<MyPositionIncludingLocationSerciceCheckPage> {


  @override
  void initState(){
    super.initState();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    /*
    Current location:
    To query the current location of the device simply make a call to the getCurrentPosition method. You can finetune the results by specifying the following parameters:

    desiredAccuracy: the accuracy of the location data that your app wants to receive;
    timeLimit: the maximum amount of time allowed to acquire the current location. When the time limit is passed a TimeOutException will be thrown and the call will be cancelled. By default no limit is configured.

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     */


    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Determine My Position'),
      ),
      body: Center(
        // Using FutureBuilder to handle asynchronous operations
        child: FutureBuilder<Position>(
          // The future to wait for
          future: _determinePosition(),
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
                  return Text('Lat: ${snapshot.data?.latitude}, Lng: ${snapshot.data?.longitude}');
                }
            }
          },
        ),
      ),
    );
  }
}
