

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Model
class User {
  String name;
  String email;

  User(this.name, this.email);
}

// ViewModel
class UserProfileViewModel extends ChangeNotifier {
  late User _user;
  User get user => _user;

  void fetchUser() {
    _user = User('John Doe', 'john@example.com');
    notifyListeners();
  }
}

// View
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${viewModel.user.name}'),
            Text('Email: ${viewModel.user.email}'),
          ],
        ),
      ),
    );
  }
}
