import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/memento/memento.dart';

class ShapeContainer extends StatelessWidget {
  const ShapeContainer({
    Key? key,
    required this.shape,
  }) : super(key: key);

  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: shape.width,
          height: shape.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: shape.color,
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
