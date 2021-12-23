import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/activity_indicator/material_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/slider/material_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/switch/material_switch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/widgets.dart';

class MaterialWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    return MaterialActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return MaterialSlider();
  }

  @override
  ISwitch createSwitch() {
    return MaterialSwitch();
  }

  @override
  String getTitle() {
    return "Android Widgets";
  }
}
