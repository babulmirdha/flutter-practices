import 'package:create_different_ui_for_different_user_demo/regular_ui.dart';
import 'package:flutter/material.dart';

import 'admin_ui.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String name;
  final bool isAdmin;

  User({required this.name, required this.isAdmin});
}

class MyApp extends StatelessWidget {
  final User currentUser = User(name: "John Doe", isAdmin: false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User-specific UI'),
        ),
        body: buildUserSpecificUI(),
      ),
    );
  }

  Widget buildUserSpecificUI() {
    if (currentUser.isAdmin) {
      return AdminUI(user: currentUser);
    } else {
      return RegularUI(user: currentUser);
    }
  }
}




