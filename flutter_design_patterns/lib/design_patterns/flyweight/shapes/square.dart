import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';

class Square implements IPositionedShape {
  final double width;
  final Color color;

  const Square({
    required this.width,
    required this.color,
  });

  @override
  Widget render({required double x, required double y}) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
