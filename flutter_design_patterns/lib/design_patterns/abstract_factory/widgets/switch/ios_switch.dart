import 'package:flutter/cupertino.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_switch.dart';

class IosSwitch implements ISwitch {
  @override
  Widget render({required bool value, required ValueSetter<bool> onChanged}) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
