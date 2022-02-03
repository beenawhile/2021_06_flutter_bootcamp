import 'package:flutter/material.dart';

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({Key? key}) : super(key: key);

  @override
  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _width = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      _updateWidth(_controller.value * 100);
    });
    _controller.addStatusListener(_animationStatus);
    _controller.forward();
  }

  void _animationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateWidth(double width) {
    setState(() {
      _width = width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: _width,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
        Row(children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _controller.repeat(reverse: true);
            },
            child: const Text('Repeat'),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.stop();
            },
            child: const Text('Stop'),
          )
        ]),
      ],
    );
  }
}
