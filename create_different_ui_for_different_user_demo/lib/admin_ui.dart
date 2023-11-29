import 'package:create_different_ui_for_different_user_demo/main.dart';
import 'package:flutter/material.dart';

class AdminUI extends StatelessWidget {
  final User user;

  const AdminUI({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Welcome, ${user.name} (Admin)'),
          // Add admin-specific widgets here
        ],
      ),
    );
  }
}