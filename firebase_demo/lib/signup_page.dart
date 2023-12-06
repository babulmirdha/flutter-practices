import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/login_page.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _naneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ).then((value) async {


        await _firestore.collection("users").doc(value.user!.uid).set({
          "name": _naneController.text,
          "email": _emailController.text,
          "mobile": _mobileController.text,
        });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));


      });
      print("Sign up successful");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _naneController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _signUpWithEmailAndPassword,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
