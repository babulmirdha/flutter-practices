import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/AuthCotroller.dart';

class SignupPage extends StatelessWidget {
  final _controller = Get.put(AuthController());
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final gender = TextEditingController();
  final dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: password, decoration: InputDecoration(labelText: "Password")),
            TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: gender, decoration: InputDecoration(labelText: "Gender")),
            TextField(controller: dob, decoration: InputDecoration(labelText: "DOB (YYYY-MM-DD)")),
            ElevatedButton(
              onPressed: () {
                _controller.signup({
                  'email': email.text,
                  'password': password.text,
                  'name': name.text,
                  'gender': gender.text,
                  'dob': dob.text,
                });
              },
              child: Text("Signup"),
            )
          ],
        ),
      ),
    );
  }
}
