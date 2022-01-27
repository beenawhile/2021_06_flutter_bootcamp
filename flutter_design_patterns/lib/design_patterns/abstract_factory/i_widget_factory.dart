import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';

abstract class IWidgetFactory {
  String getTitle();
  IActivityIndicator createActivityIndicatory();
  ISlider createSlider();
  ISwitch createSwitch();
}
