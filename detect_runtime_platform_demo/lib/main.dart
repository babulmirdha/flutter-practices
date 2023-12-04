import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/android/AndroidHomePage.dart';
import 'pages/ios/IOSHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return MaterialApp(
        title: 'Android App',
        home: AndroidHomePage(),
      );
    } else if (Platform.isIOS) {
      return CupertinoApp(
        title: 'iOS App',
        home: IOSHomePage(),
      );
    } else {
      return const Center(
        child: Text('Unsupported platform'),
      );
    }
  }
}




