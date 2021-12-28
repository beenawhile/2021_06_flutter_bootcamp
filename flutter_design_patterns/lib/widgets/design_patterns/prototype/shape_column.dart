import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/prototype/prototype.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class ShapeColumn extends StatelessWidget {
  final Shape shape;
  final Shape? shapeClone;
  final VoidCallback onRandomisePropertiesPressed;
  final VoidCallback onClonePressed;

  const ShapeColumn({
    Key? key,
    required this.shape,
    required this.shapeClone,
    required this.onRandomisePropertiesPressed,
    required this.onClonePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _ShapeWithLabel(
                label: "Original shape",
                child: shape.render(),
              ),
            ),
            Expanded(
              child: _ShapeWithLabel(
                label: "Cloned shape",
                child: shapeClone == null
                    ? const SizedBox(
                        height: 120,
                        width: 120,
                        child: Placeholder(),
                      )
                    : shapeClone!.render(),
              ),
            ),
          ],
        ),
        PlatformButton(
          text: "Randomise properties",
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: onRandomisePropertiesPressed,
        ),
        PlatformButton(
          text: "Clone",
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: onClonePressed,
        ),
      ],
    );
  }
}

class _ShapeWithLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const _ShapeWithLabel({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: LayoutConstants.spaceM),
        child,
      ],
    );
  }
}
