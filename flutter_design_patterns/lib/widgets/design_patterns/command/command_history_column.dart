import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

class CommandHistoryColumn extends StatelessWidget {
  const CommandHistoryColumn({
    Key? key,
    required this.commandList,
  }) : super(key: key);

  final List<String> commandList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Command history:",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceS),
        if (commandList.isNotEmpty)
          for (int i = 0; i < commandList.length; i++)
            Text("${i + 1}. ${commandList[i]}")
      ],
    );
  }
}
