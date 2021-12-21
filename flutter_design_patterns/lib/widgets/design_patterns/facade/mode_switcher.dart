import 'package:flutter/material.dart';

class ModeSwitcher extends StatelessWidget {
  const ModeSwitcher({
    Key? key,
    required this.title,
    required this.activated,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final bool activated;
  final ValueSetter<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: activated,
      onChanged: onChanged,
      activeColor: Colors.black,
      title: Text(title),
    );
  }
}
