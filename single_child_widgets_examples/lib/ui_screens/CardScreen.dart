import 'package:flutter/material.dart';


class CardScreen extends StatelessWidget  {


  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body:  Card(
        elevation: 5, // Determines the shadow intensity
        margin: const EdgeInsets.all(16), // Margin around the card
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text('John Doe'),
              subtitle: Text('johndoe@example.com'),
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('CALL'),
                  onPressed: () {
                    // Perform action on button press
                  },
                ),
                TextButton(
                  child: const Text('EMAIL'),
                  onPressed: () {
                    // Perform action on button press
                  },
                ),
              ],
            ),
          ],
        ),
      )
      ,
    );
  }



}