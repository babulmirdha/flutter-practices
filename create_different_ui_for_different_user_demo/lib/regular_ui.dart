import 'package:flutter/material.dart';

import 'main.dart';

class RegularUI extends StatelessWidget {
  final User user;

  RegularUI({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Welcome, ${user.name}'),
          // Add regular user-specific widgets here
        ],
      ),
    );
  }
}