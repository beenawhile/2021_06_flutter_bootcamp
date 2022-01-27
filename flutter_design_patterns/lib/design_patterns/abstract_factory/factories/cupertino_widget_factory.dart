import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/activity_indicator/ios_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/slider/ios_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/switch/ios_switch.dart';

class CupertinoWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicatory() {
    return IosActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }

  @override
  String getTitle() {
    return "iOS Widgets";
  }
}
