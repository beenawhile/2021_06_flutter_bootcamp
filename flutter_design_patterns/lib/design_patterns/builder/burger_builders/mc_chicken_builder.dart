import 'package:flutter_design_patterns/design_patterns/builder/burger_builder_base.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredients/ingredients.dart';

class McChickenBuilder extends BurgerBuilderBase {
  McChickenBuilder() {
    price = 1.29;
  }

  @override
  void addBuns() {
    burger.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    // Not needed
  }

  @override
  void addPatties() {
    burger.addIngredient(McChickenPatty());
  }

  @override
  void addSauces() {
    burger.addIngredient(Mayonnaise());
  }

  @override
  void addSeasoning() {
    // Not needed
  }

  @override
  void addVegetables() {
    burger.addIngredient(ShreddedLettuce());
  }
}
