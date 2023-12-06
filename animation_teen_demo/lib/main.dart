import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTweenAnimation(),
    );
  }
}

class MyTweenAnimation extends StatefulWidget {
  @override
  _MyTweenAnimationState createState() => _MyTweenAnimationState();
}

class _MyTweenAnimationState extends State<MyTweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween for the Offset property
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _offsetAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Start the animation when the FAB is pressed
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
