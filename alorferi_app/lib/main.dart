import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/CertReader.dart';
import 'pages/login_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CertReader.initialize();

  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}