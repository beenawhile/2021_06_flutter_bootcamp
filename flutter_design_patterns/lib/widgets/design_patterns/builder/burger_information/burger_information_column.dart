import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';

import 'package:flutter_design_patterns/design_patterns/builder/builder.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/builder/burger_information/burger_information_label.dart';

class BurgerInformationColumn extends StatelessWidget {
  const BurgerInformationColumn({
    Key? key,
    required this.burger,
  }) : super(key: key);

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BurgerInformationLabel(label: "Price"),
        Text(burger.getFormattedPrice()),
        const SizedBox(height: LayoutConstants.spaceM),
        const BurgerInformationLabel(label: "Ingredients"),
        Text(
          burger.getFormattedIngredients(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        const BurgerInformationLabel(label: "Allergens"),
        Text(
          burger.getFormattedAllergens(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
