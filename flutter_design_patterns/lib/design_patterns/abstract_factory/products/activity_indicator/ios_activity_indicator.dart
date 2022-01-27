import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render({
    required double radius,
  }) {
    return CupertinoActivityIndicator(
      radius: radius,
    );
  }
}
