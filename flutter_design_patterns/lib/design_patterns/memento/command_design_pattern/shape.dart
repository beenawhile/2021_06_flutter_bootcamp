import 'package:flutter/material.dart';

class Shape {
  late double width;
  late double height;
  late Color color;

  Shape(this.color, this.height, this.width);

  Shape.initial() {
    color = Colors.black;
    width = 150;
    height = 150;
  }

  Shape.copy(Shape shape) : this(shape.color, shape.height, shape.width);
}
