import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/decorator/pizza_topping_data.dart';

class CustomPizzaSelection extends StatelessWidget {
  const CustomPizzaSelection({
    Key? key,
    required this.pizzaToppingsDataMap,
    required this.onSelected,
  }) : super(key: key);

  final Map<int, PizzaToppingData> pizzaToppingsDataMap;
  final Function(int, bool?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: LayoutConstants.spaceM,
      children: [
        for (var i = 0; i < pizzaToppingsDataMap.length; i++)
          i == 0
              ? ChoiceChip(
                  label: const Text(
                    "Pizza Base",
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: true,
                  selectedColor: Colors.black,
                  onSelected: (_) {},
                )
              : ChoiceChip(
                  label: Text(
                    pizzaToppingsDataMap[i]!.label,
                    style: TextStyle(
                      color: pizzaToppingsDataMap[i]!.selected
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  selected: pizzaToppingsDataMap[i]!.selected,
                  selectedColor: Colors.black,
                  onSelected: (bool? selected) => onSelected(i, selected),
                )
      ],
    );
  }
}
