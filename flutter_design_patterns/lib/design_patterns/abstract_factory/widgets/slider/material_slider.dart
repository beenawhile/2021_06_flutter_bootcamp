import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_slider.dart';

class MaterialSlider implements ISlider {
  @override
  Widget render({
    required double value,
    required ValueSetter<double> onChanged,
  }) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      min: 0.0,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}
