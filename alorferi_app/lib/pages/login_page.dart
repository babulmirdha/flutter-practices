import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/login_controller.dart';

class LoginPage extends StatelessWidget {

  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController(text:"");
  final TextEditingController passwordController = TextEditingController(text:"");

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 32.0),
            Obx(() => ElevatedButton(
              onPressed: loginController.isLoading() ? null : () => _login(),
              child: loginController.isLoading() ? const CircularProgressIndicator() : const Text('Login'),
            )),
            const SizedBox(height: 16.0),
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
