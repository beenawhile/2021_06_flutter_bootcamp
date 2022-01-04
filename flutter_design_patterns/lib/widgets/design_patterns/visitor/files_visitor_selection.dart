import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

class FilesVisitorSelection extends StatelessWidget {
  const FilesVisitorSelection({
    Key? key,
    required this.visitorsList,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  final List<IVisitor> visitorsList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < visitorsList.length; i++)
          RadioListTile(
            title: Text(visitorsList[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
