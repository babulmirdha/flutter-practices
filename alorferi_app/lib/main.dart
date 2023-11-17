import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CertReader.dart';
import 'LoginPage.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CertReader.initialize();

  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}