import 'package:flutter/material.dart';

abstract class ButtonDelegate {
  void onPressed() {
    // Delegate logic for button press
  }
}

class MyButton extends StatelessWidget {
  final ButtonDelegate delegate;

  final String text;

  const MyButton(this.delegate, {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: delegate.onPressed,
      child: Text(text),
    );
  }
}
