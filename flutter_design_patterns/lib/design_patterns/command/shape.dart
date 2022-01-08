import 'package:flutter/material.dart';

class Shape {
  late double width;
  late double height;
  late Color color;

  Shape.initial() {
    color = Colors.black;
    height = 150;
    width = 150;
  }
}
