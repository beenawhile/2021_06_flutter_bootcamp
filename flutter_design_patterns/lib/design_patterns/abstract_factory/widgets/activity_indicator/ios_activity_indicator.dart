import 'package:flutter/cupertino.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_activity_indicator.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return const CupertinoActivityIndicator();
  }
}
