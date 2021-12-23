import 'package:flutter/cupertino.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_slider.dart';

class IosSlider implements ISlider {
  @override
  Widget render(
      {required double value, required ValueSetter<double> onChanged}) {
    return CupertinoSlider(
      min: 0,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}
