import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AspectRatioScreen extends StatelessWidget  {

  const AspectRatioScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.blueGrey,
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network('https://leads.com.bd/wp-content/uploads/2022/07/Babul-Mirdha.png', fit: BoxFit.cover),
            ),
            //5. Circular Avatars:
            AspectRatio(
              aspectRatio: 2, // Ensures a perfect circle
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text('A', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            // Responsive UI
            AspectRatio(
              aspectRatio: 3 / 2, // A specific aspect ratio for a responsive widget
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text('Responsive Widget'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}