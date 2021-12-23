import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/activity_indicator/ios_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/slider/ios_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/switch/ios_switch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/widgets.dart';

class IosWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
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
