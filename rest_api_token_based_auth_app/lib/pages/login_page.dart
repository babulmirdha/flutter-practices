import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_token_based_auth_app/pages/signup_page.dart';

import '../controllers/AuthCotroller.dart';


class LoginPage extends StatelessWidget {
  final _controller = Get.find<AuthController>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _controller.login(email.text, password.text),
              child: Text("Login"),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Get.to(() => SignupPage());
              },
              child: Text("Don't have an account? Sign up"),
            )
          ],
        ),
      ),
    );
  }

}
