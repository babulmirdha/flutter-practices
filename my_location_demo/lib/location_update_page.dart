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
  StreamSubscription<Position>? _positionStream;
  String _locationText = "Waiting for location...";

  @override
  void initState() {
    super.initState();
    _checkPermissionAndStartStream();
  }

  Future<void> _checkPermissionAndStartStream() async {
    // 1. Check location services
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationText = 'Location services are disabled.';
      });
      return;
    }

    // 2. Check permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationText = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationText =
        'Location permissions are permanently denied. Go to settings.';
      });
      return;
    }

    // 3. Start location updates
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );

    _positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position position) {
      setState(() {
        _locationText =
        'Lat: ${position.latitude}, Lon: ${position.longitude}';
      });
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Location')),
      body: Center(
        child: Text(
          _locationText,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
