import 'package:animation_demo/details_page.dart';
import 'package:flutter/material.dart';

import 'user_details_page.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Page'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(tagName: 'uniqueTag'),
                  ),
                );
              },
              child: Hero(
                tag: 'uniqueTag',
                child: Container(
                  color: Colors.blue,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsPage(tagName: 'userTag'),
                  ),
                );
              },
              child: Hero(
                tag: 'userTag',
                child: Image.asset("assets/babulmirdha.png",width: 100, height: 100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}