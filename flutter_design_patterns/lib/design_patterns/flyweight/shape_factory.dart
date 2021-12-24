import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_type.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shapes/circle.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shapes/square.dart';

class ShapeFactory {
  const ShapeFactory();
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.circle:
        return Circle(
          color: Colors.red.withOpacity(.2),
          diameter: 10.0,
        );
      case ShapeType.square:
        return Square(
          width: 10.0,
          color: Colors.blue.withOpacity(.2),
        );
      default:
        throw Exception("Shape type '$shapeType' is not supported");
    }
  }
}
