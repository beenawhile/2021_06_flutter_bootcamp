import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget render({required double radius}) {
    return SizedBox(
      width: radius,
      height: radius,
      child: CircularProgressIndicator(
        backgroundColor: const Color(0xFFECECEC),
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.black.withOpacity(.65),
        ),
      ),
    );
  }
}
