import 'dart:math';

import 'package:animation_course/0_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class AnimatedContainerPracticePage extends StatefulWidget {
  const AnimatedContainerPracticePage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPracticePageState createState() =>
      _AnimatedContainerPracticePageState();
}

class _AnimatedContainerPracticePageState
    extends State<AnimatedContainerPracticePage> {
  var _size = const Size(200, 200);
  var _padding = const EdgeInsets.all(9);
  var _margin = const EdgeInsets.all(0);

  var _borderSize = 1.0;
  var _borderRadius = 0.0;
  var _rotation = 0.0;

  var _color = mustard;
  var _boxShadow = [
    const BoxShadow(
      color: Colors.grey,
      offset: Offset(15.0, 15.0),
      blurRadius: 20.0,
    )
  ];

  final _randomColor = RandomColor();
  final _random = Random();

  void _animateSize() {
    setState(() {
      _size = Size(
        10 + _random.nextInt(300).toDouble(),
        10 + _random.nextInt(300).toDouble(),
      );
    });
  }

  void _animatePadding() {
    setState(() {
      _padding = EdgeInsets.all(8.0 + _random.nextInt(32));
    });
  }

  void _animateMargin() {
    setState(() {
      _margin = EdgeInsets.all(0.0 + _random.nextInt(24));
    });
  }

  void _animateBorder() {
    setState(() {
      _borderSize = _random.nextInt(10).toDouble();
    });
  }

  void _animateBorderRadius() {
    setState(() {
      _borderRadius = _random.nextInt(20).toDouble();
    });
  }

  void _animateColor() {
    setState(() {
      _color = _randomColor.randomColor();
    });
  }

  void _animateBoxShadow() {
    setState(() {
      _boxShadow = [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(
            _random.nextInt(15).toDouble(),
            _random.nextInt(15).toDouble(),
          ),
          blurRadius: _random.nextInt(25).toDouble(),
        )
      ];
    });
  }

  void _animateRotation() {
    setState(() {
      _rotation = _random.nextInt(300).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _size.width,
          height: _size.height,
          padding: _padding,
          margin: _margin,
          decoration: BoxDecoration(
            color: _color,
            border: Border.all(width: _borderSize),
            boxShadow: _boxShadow,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          transform: Matrix4.translation(vmath.Vector3(0, 0, 0))
            ..rotateZ(_rotation),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              DemoButton(
                onPressed: _animateSize,
                label: "Animate Size",
              ),
              DemoButton(
                onPressed: _animateMargin,
                label: "Animate Margin",
              ),
              DemoButton(
                onPressed: _animatePadding,
                label: "Animate Padding",
              ),
              DemoButton(
                onPressed: _animateBorder,
                label: "Animate Border",
              ),
              DemoButton(
                onPressed: _animateBorderRadius,
                label: "Animate Border Radius",
              ),
              DemoButton(
                onPressed: _animateColor,
                label: "Animate Color",
              ),
              DemoButton(
                onPressed: _animateRotation,
                label: "Animate Rotation",
              ),
              DemoButton(
                onPressed: _animateBoxShadow,
                label: "Animate Box Shadow",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
