import 'package:flutter/material.dart';

abstract class ISwitch {
  Widget render({
    required bool value,
    required ValueSetter<bool> onChanged,
  });
}
