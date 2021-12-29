import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza_menu.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza_topping_data.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/decorator/custom_pizza_selection.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/decorator/pizza_information.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/decorator/pizza_selection.dart';

class DecoratorExample extends StatefulWidget {
  const DecoratorExample({Key? key}) : super(key: key);

  @override
  _DecoratorExampleState createState() => _DecoratorExampleState();
}

class _DecoratorExampleState extends State<DecoratorExample> {
  final PizzaMenu pizzaMenu = PizzaMenu();

  late Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  late Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingsDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void _onSelectedIndexChanged(int? index) {
    _setSelectedIndex(index!);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setSelectedPizza(int index) {
    setState(() {
      _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap);
    });
  }

  void _onCustomPizzaChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedPizza(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap[index]!.setSeletected(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Select the pizza",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            PizzaSelection(
              selectedIndex: _selectedIndex,
              onChanged: _onSelectedIndexChanged,
            ),
            if (_selectedIndex == 2)
              CustomPizzaSelection(
                pizzaToppingsDataMap: _pizzaToppingsDataMap,
                onSelected: _onCustomPizzaChipSelected,
              ),
            PizzaInformation(pizza: _pizza),
          ],
        ),
      ),
    );
  }
}
