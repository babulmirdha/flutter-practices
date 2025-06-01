import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/AuthCotroller.dart';


class UserInfoPage extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Info')),
      body: Obx(() {
        final user = controller.user.value;
        if (user == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, size: 80, color: Colors.blueAccent),
                  SizedBox(height: 16),
                  _buildRow("Name", user.name),
                  _buildRow("Email", user.email),
                  _buildRow("Gender", user.gender),
                  _buildRow("DOB", user.dob),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$label: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
