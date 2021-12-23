import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_switch.dart';

class MaterialSwitch implements ISwitch {
  @override
  Widget render({required bool value, required ValueSetter<bool> onChanged}) {
    return Switch(
      activeColor: Colors.black,
      value: value,
      onChanged: onChanged,
    );
  }
}
