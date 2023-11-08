import 'package:flutter/material.dart';

class CustomSingleChildLayoutWidget extends SingleChildLayoutDelegate {
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Position the child at the center of the screen
    double x = (size.width - childSize.width) / 2;
    double y = (size.height - childSize.height) / 5;
    return Offset(x, y);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // Constrain the child's width and height
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: constraints.maxHeight,
      maxHeight: constraints.maxHeight,
    );
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    // We don't need to relayout since the position is fixed
    return false;
  }
}
