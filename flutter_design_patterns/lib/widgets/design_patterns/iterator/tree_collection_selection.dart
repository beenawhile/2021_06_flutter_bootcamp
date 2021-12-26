import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/i_tree_collection.dart';

class TreeCollectionSelection extends StatelessWidget {
  const TreeCollectionSelection({
    Key? key,
    required this.treeCollections,
    required this.selectedIndex,
    this.onChanged,
  }) : super(key: key);

  final List<ITreeCollection> treeCollections;
  final int selectedIndex;
  final ValueSetter<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < treeCollections.length; i++)
          RadioListTile(
            title: Text(treeCollections[i].getTitle()),
            value: i,
            activeColor: Colors.black,
            selected: i == selectedIndex,
            controlAffinity: ListTileControlAffinity.platform,
            groupValue: selectedIndex,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
