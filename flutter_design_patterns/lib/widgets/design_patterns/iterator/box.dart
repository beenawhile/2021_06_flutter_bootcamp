import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';

class Box extends StatelessWidget {
  const Box({
    Key? key,
    required this.nodeId,
    required this.color,
    this.child,
  }) : super(key: key);

  final int nodeId;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingM),
        child: Column(
          children: [
            Text(
              nodeId.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}
