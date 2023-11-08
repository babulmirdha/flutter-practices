import 'package:flutter/material.dart';
import 'package:mvvm_pattern/user.dart';
import 'package:provider/provider.dart';

class UserViewModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}