import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginController.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController(text:"");
  final TextEditingController passwordController = TextEditingController(text:"");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32.0),
            Obx(() => ElevatedButton(
              onPressed: loginController.isLoading() ? null : () => _login(),
              child: loginController.isLoading() ? CircularProgressIndicator() : Text('Login'),
            )),
            SizedBox(height: 16.0),
            Obx(() => Text('Token: ${loginController.token}')),
          ],
        ),
      ),
    );
  }

  void _login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    loginController.login(username, password);
  }
}
