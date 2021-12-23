import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/widgets.dart';

abstract class IWidgetFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISwitch createSwitch();
  ISlider createSlider();
}
