import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';

class IosSlider implements ISlider {
  @override
  Widget render(
      {required double value, required ValueSetter<double>? onChanged}) {
    return CupertinoSlider(
      max: 100,
      value: value,
      onChanged: onChanged,
    );
  }
}
