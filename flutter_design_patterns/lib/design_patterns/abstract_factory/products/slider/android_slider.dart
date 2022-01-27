import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';

class AndroidSlider implements ISlider {
  @override
  Widget render(
      {required double value, required ValueSetter<double>? onChanged}) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      max: 100,
      value: value,
      onChanged: onChanged,
    );
  }
}
