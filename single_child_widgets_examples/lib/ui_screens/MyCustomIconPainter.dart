import 'package:flutter/material.dart';

class MyCustomIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Define the star shape path
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.65)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width / 2, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.3, size.height * 0.65)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..close();

    // Draw the star shape on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
