
import 'package:flutter/material.dart';

// Model
class User {
  String name;
  String email;

  User(this.name, this.email);
}

// View
class UserProfilePage extends StatelessWidget {
  final User user;
  const UserProfilePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}

// Controller
class UserProfileController {
  User fetchUser() {
    // Logic to fetch user from API or database
    return User('John Doe', 'john@example.com');
  }
}
