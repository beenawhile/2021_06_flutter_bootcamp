import 'package:flutter/material.dart';

abstract class ISlider {
  Widget render({
    required double value,
    required ValueSetter<double> onChanged,
  });
}
