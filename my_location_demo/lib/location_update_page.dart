import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUpdatePage extends StatefulWidget {
  const LocationUpdatePage({super.key});

  @override
  State<LocationUpdatePage> createState() => _LocationUpdatePageState();
}

class _LocationUpdatePageState extends State<LocationUpdatePage> {
  late LocationSettings locationSettings;
  late StreamSubscription<Position> positionStream;

  String text = "";

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
          "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: "Running in Background",
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
              (Position? position) {

                setState(() {
                  text =  position == null
                      ? 'Unknown'
                      : '${position.latitude.toString()}, ${position.longitude.toString()}';
                });

            print(text);
          },
        );
  }

  @override
  void dispose() {
    positionStream.cancel(); // Cancel the stream subscription when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation App'),
      ),
      body: Center(
        child: Text('Listening for location updates:\n$text'),
      ),
    );
  }
}