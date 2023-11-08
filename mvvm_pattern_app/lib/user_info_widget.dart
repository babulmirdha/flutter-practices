import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_view_model.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userViewModel = Provider.of<UserViewModel>(context);

    if (userViewModel.user == null) {
      return const Text('No user data available');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: ${userViewModel.user!.name}'),
        Text('Age: ${userViewModel.user!.age}'),
      ],
    );
  }
}
