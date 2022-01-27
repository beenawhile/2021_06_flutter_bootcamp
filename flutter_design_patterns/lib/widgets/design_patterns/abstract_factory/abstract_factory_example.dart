import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/factories/cupertino_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/factories/material_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/products/i_switch.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/abstract_factory/factory_selection.dart';

class AbstractFactoryExample extends StatefulWidget {
  const AbstractFactoryExample({Key? key}) : super(key: key);

  @override
  _AbstractFactoryExampleState createState() => _AbstractFactoryExampleState();
}

class _AbstractFactoryExampleState extends State<AbstractFactoryExample> {
  final widgetsFactoryList = <IWidgetFactory>[
    MaterialWidgetFactory(),
    CupertinoWidgetFactory(),
  ];

  int _selectedFactoryIndex = 0;

  late IActivityIndicator _activityIndicator;
  late ISwitch _switch;
  late ISlider _slider;

  double _sliderValue = 50;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  bool _switchValue = false;
  String get _switchValueString => _switchValue ? "ON" : "OFF";

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicatory();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int? index) {
    setState(() {
      _selectedFactoryIndex = index!;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: [
            FactorySelection(
              widgetsFactoryList: widgetsFactoryList,
              selectedIndex: _selectedFactoryIndex,
              onChanged: _setSelectedFactoryIndex,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            Text(
              "Widget showcase",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: LayoutConstants.spaceXL),
            Text(
              'Process indicator',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            _activityIndicator.render(radius: 30),
            const SizedBox(height: LayoutConstants.spaceXL),
            Text(
              'Slider ($_sliderValueString%)',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            _slider.render(value: _sliderValue, onChanged: _setSliderValue),
            const SizedBox(height: LayoutConstants.spaceXL),
            Text(
              'Switch ($_switchValueString)',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            _switch.render(value: _switchValue, onChanged: _setSwitchValue),
          ],
        ),
      ),
    );
  }
}
