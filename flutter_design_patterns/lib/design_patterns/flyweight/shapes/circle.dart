import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';

class Circle implements IPositionedShape {
  final Color color;
  final double diameter;

  const Circle({
    required this.color,
    required this.diameter,
  });
  @override
  Widget render({required double x, required double y}) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
