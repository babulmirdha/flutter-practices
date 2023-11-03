import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'user_view_model.dart';
import 'package:mvvm_pattern/user.dart';
import 'user_info_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVVM Pattern Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserInfoWidget(),
              ElevatedButton(
                onPressed: () {
                  var userViewModel = Provider.of<UserViewModel>(context, listen: false);
                  userViewModel.setUser(User(name: 'John Doe', age: 30));
                },
                child: Text('Set User Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
