import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/prototype.dart';

class Circle extends Shape {
  late double radius;

  Circle(Color color, this.radius) : super(color);

  Circle.initial() : super(Colors.black) {
    radius = 50.0;
  }

  Circle.clone(Circle source) : super.clone(source) {
    radius = source.radius;
  }

  @override
  Shape clone() {
    return Circle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
        random.integer(255), random.integer(255), random.integer(255), 1);
    radius = random.integer(50, min: 25).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 2 * radius,
          height: 2 * radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
