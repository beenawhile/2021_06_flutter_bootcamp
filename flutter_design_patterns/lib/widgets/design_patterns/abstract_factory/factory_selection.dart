import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/i_widget_factory.dart';

class FactorySelection extends StatelessWidget {
  const FactorySelection({
    Key? key,
    required this.widgetsFactoryList,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  final List<IWidgetFactory> widgetsFactoryList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < widgetsFactoryList.length; i++)
          RadioListTile(
            title: Text(widgetsFactoryList[i].getTitle()),
            value: i,
            selected: i == selectedIndex,
            groupValue: selectedIndex,
            onChanged: onChanged,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
          ),
      ],
    );
  }
}
