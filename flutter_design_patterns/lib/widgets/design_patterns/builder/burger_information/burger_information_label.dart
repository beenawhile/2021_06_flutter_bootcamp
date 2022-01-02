import 'package:flutter/material.dart';

class BurgerInformationLabel extends StatelessWidget {
  const BurgerInformationLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
