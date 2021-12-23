import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/i_activity_indicator.dart';

class MaterialActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: const Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black.withOpacity(.65),
      ),
    );
  }
}
