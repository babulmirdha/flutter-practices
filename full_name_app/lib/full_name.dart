import 'package:flutter/material.dart';

class FullName extends StatefulWidget {
  const FullName({super.key});

  @override
  State<FullName> createState() => _FullNameState();
}

class _FullNameState extends State<FullName> {

  String fullName= "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Full Name App"),),
      body: Center(
        child: Column(
          children: [
              TextField(
                controller: firstNameController,
              ),
              TextField(
                controller: lastNameController,
              ),
            TextButton(onPressed: (){
              setState(() {
                fullName = "${firstNameController.text} ${lastNameController.text}";
              });

            }, child: Text("Add")),
            Text("Full Name: $fullName")
          ],
        ),
      ),
    );
  }
}
