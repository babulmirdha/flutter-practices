import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserListUsingStreamPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Stream Example'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          // Extract the documents from the snapshot
          List<DocumentSnapshot>? documents = snapshot.data?.docs;

          // Process the data and build your UI here
          // Example: Display the document data in a ListView
          return ListView.builder(
            itemCount: documents?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(documents?[index]['name']),
              );
            },
          );
        },
      ),
    );
  }
}