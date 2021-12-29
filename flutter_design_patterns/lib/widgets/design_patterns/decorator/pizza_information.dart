import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/decorator/pizza.dart';

class PizzaInformation extends StatelessWidget {
  const PizzaInformation({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Pizza details:",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceL),
        Text(
          pizza.getDescription(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        Text("Price: \$${pizza.getPrice().toStringAsFixed(2)}")
      ],
    );
  }
}
