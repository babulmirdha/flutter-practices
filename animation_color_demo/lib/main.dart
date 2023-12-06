import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyColorTweenAnimation(),
    );
  }
}

class MyColorTweenAnimation extends StatefulWidget {
  @override
  _MyColorTweenAnimationState createState() => _MyColorTweenAnimationState();
}

class _MyColorTweenAnimationState extends State<MyColorTweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween for the Color property
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Tween Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              color: _colorAnimation.value,
              child: Center(
                child: Text(
                  'Color Animation',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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

  @override
  void dispose() {
    // Dispose of the AnimationController when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
