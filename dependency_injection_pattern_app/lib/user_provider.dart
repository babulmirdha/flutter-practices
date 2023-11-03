import 'package:flutter/material.dart';

import 'user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  String get user => _userService.getUser();
}

