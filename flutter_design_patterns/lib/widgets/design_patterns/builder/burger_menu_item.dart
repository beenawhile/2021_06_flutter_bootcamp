import 'package:flutter_design_patterns/design_patterns/builder/builder.dart';

class BurgerMenuItem {
  final String label;
  final BurgerBuilderBase burgerBuilder;
  const BurgerMenuItem({
    required this.label,
    required this.burgerBuilder,
  });
}
