import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/builder/builder.dart';
import 'package:flutter_design_patterns/design_patterns/builder/burger_builders/big_mac_builder.dart';
import 'package:flutter_design_patterns/design_patterns/builder/burger_builders/cheese_burger_builder.dart';
import 'package:flutter_design_patterns/design_patterns/builder/burger_builders/hamburger_builder.dart';
import 'package:flutter_design_patterns/design_patterns/builder/burger_builders/mc_chicken_builder.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/builder/burger_information/burger_information_column.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/builder/burger_menu_item.dart';

class BuilderExample extends StatefulWidget {
  const BuilderExample({Key? key}) : super(key: key);

  @override
  _BuilderExampleState createState() => _BuilderExampleState();
}

class _BuilderExampleState extends State<BuilderExample> {
  final BurgerMaker _burgerMaker = BurgerMaker(HamburgerBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];

  late BurgerMenuItem _selectedBurgerMenuItem;
  late Burger _selectedBurger;

  @override
  void initState() {
    super.initState();
    _burgerMenuItems.addAll(
      [
        BurgerMenuItem(
          label: "Hamburger",
          burgerBuilder: HamburgerBuilder(),
        ),
        BurgerMenuItem(
          label: "Cheeseburger",
          burgerBuilder: CheeseBurgerBuilder(),
        ),
        BurgerMenuItem(
          label: "Big Mac\u00AE",
          burgerBuilder: BigMacBuilder(),
        ),
        BurgerMenuItem(
          label: "McChicken\u00AE",
          burgerBuilder: McChickenBuilder(),
        ),
      ],
    );

    _selectedBurgerMenuItem = _burgerMenuItems[0];
    _selectedBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();

    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerMenuItem? selectedItem) {
    setState(() {
      _selectedBurgerMenuItem = selectedItem!;
      _burgerMaker.changeBurgerBuilder(selectedItem.burgerBuilder);
      _selectedBurger = _prepareSelectedBurger();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Select menu item:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            DropdownButton(
              value: _selectedBurgerMenuItem,
              items: _burgerMenuItems
                  .map<DropdownMenuItem<BurgerMenuItem>>(
                    (BurgerMenuItem item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.label),
                    ),
                  )
                  .toList(),
              onChanged: _onBurgerMenuItemChanged,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            Row(
              children: [
                Text(
                  "Information:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            BurgerInformationColumn(burger: _selectedBurger),
          ],
        ),
      ),
    );
  }
}
