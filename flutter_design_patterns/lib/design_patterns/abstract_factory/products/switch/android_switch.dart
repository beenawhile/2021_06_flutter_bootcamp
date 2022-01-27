import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';

class AndroidSwitch implements ISwitch {
  @override
  Widget render({required bool value, required ValueSetter<bool> onChanged}) {
    return Switch(
      activeColor: Colors.black,
      inactiveThumbColor: Colors.grey,
      value: value,
      onChanged: onChanged,
    );
  }
}
