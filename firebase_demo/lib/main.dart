import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/login_page.dart';
import 'package:firebase_demo/signup_page.dart';
import 'package:firebase_demo/user_list_using_stream_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      home: UserListUsingStreamPage(),
    );
  }
}
