import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/factory_method/factory_method.dart';

class DialogSelection extends StatelessWidget {
  const DialogSelection({
    Key? key,
    required this.customDialogList,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  final List<CustomDialog> customDialogList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < customDialogList.length; i++)
          RadioListTile<int>(
            title: Text(customDialogList[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
