import 'package:animation_course/0_widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPracticePage extends StatefulWidget {
  const AnimatedOpacityPracticePage({Key? key}) : super(key: key);

  @override
  _AnimatedOpacityPracticePageState createState() =>
      _AnimatedOpacityPracticePageState();
}

class _AnimatedOpacityPracticePageState
    extends State<AnimatedOpacityPracticePage> {
  var _opacity = 1.0;

  var _sliderValue = 1.0;

  void _changeOpacity(double value) {
    setState(() {
      _opacity = value;
    });
  }

  void _changeSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          curve: Curves.ease,
          child: const AnimateMePlease(color: salmon),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Slider(
            activeColor: salmon,
            inactiveColor: mustard,
            value: _sliderValue,
            onChanged: _changeSliderValue,
            onChangeEnd: _changeOpacity,
          ),
        ),
      ],
    );
  }
}
