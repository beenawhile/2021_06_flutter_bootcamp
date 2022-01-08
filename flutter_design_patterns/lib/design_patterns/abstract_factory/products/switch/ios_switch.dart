import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';

class IosSwitch implements ISwitch {
  @override
  Widget render({required bool value, required ValueSetter<bool> onChanged}) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
