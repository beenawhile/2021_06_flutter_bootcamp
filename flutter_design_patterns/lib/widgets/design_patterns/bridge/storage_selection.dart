import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/bridge/storages/i_storage.dart';

class StorageSelection extends StatelessWidget {
  const StorageSelection({
    Key? key,
    required this.storages,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  final List<IStorage> storages;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < storages.length; i++)
          RadioListTile(
            title: Text(storages[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          )
      ],
    );
  }
}
