import 'package:flutter/material.dart';

class DeviceIcon extends StatelessWidget {
  const DeviceIcon({
    Key? key,
    required this.iconData,
    required this.activated,
  }) : super(key: key);

  final IconData iconData;
  final bool activated;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: activated ? Colors.green : Colors.red,
      size: 42,
    );
  }
}
