import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTextTweenAnimation(),
    );
  }
}

class MyTextTweenAnimation extends StatefulWidget {
  const MyTextTweenAnimation({super.key});

  @override
  _MyTextTweenAnimationState createState() => _MyTextTweenAnimationState();
}

class _MyTextTweenAnimationState extends State<MyTextTweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween for the font size property
    _fontSizeAnimation = Tween<double>(
      begin: 20.0,
      end: 40.0,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Tween Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: _fontSizeAnimation.value),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Start the animation when the FAB is pressed
              _controller.forward();
            },
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              // Restart the animation when this button is pressed
              _controller.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
