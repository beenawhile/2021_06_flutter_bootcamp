import 'dart:math';

import 'package:animation_course/0_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import 'package:vector_math/vector_math_64.dart' as vmath;

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color _color = mustard;

  var _size = const Size(200, 200);

  var _padding = const EdgeInsets.all(9);
  var _margin = const EdgeInsets.all(0);

  var _borderSize = 1.0;
  var _borderRadius = 0.0;
  var _rotation = 0.0;

  final _randomColor = RandomColor();
  final _random = Random();

  var _boxShadow = [
    const BoxShadow(
      color: Colors.grey,
      offset: Offset(15.0, 15.0),
      blurRadius: 20.0,
    )
  ];

  void _animateSize() {
    setState(() {
      _size = Size(10.0 + _random.nextInt(300), 10.0 + _random.nextInt(300));
    });
  }

  void _animateBorderRadius() {
    setState(() {
      _borderRadius = _random.nextInt(100).toDouble();
    });
  }

  void _animateBorderSize() {
    setState(() {
      _borderSize = _random.nextInt(10).toDouble();
    });
  }

  void _animateTransition() {
    setState(() {
      _rotation = _random.nextInt(200).toDouble();
    });
  }

  void _animateColor() {
    setState(() {
      _color = _randomColor.randomColor();
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

  void _animateBoxShadow() {
    setState(() {
      _boxShadow = [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(
            _random.nextInt(20).toDouble(),
            _random.nextInt(20).toDouble(),
          ),
          blurRadius: _random.nextInt(30).toDouble(),
        )
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          padding: _padding,
          margin: _margin,
          width: _size.width,
          height: _size.height,
          decoration: BoxDecoration(
            border: Border.all(width: _borderSize),
            boxShadow: _boxShadow,
            borderRadius: BorderRadius.circular(_borderRadius),
            color: _color,
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
                onPressed: _animatePadding,
                label: "Animate Padding",
              ),
              DemoButton(
                onPressed: _animateMargin,
                label: "Animate Margin",
              ),
              DemoButton(
                onPressed: _animateBorderSize,
                label: "Animate Border Size",
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
                onPressed: _animateTransition,
                label: "Animate Transition",
              ),
              DemoButton(
                onPressed: _animateBoxShadow,
                label: "Animate BoxShadow",
              ),
            ],
          ),
        )
      ],
    );
  }
}
