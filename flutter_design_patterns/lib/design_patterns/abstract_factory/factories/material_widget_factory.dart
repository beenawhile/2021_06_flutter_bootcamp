import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/activity_indicator/android_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/slider/android_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/switch/android_switch.dart';

class MaterialWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicatory() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }

  @override
  String getTitle() {
    return "Android Widgets";
  }
}
