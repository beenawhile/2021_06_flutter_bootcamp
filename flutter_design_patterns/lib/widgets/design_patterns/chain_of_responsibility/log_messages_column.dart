import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/chain_of_responsibility/chain_of_responsibility/chain_of_responsibility.dart';

class LogMessagesColumn extends StatelessWidget {
  const LogMessagesColumn({
    Key? key,
    required this.logMessages,
  }) : super(key: key);

  final List<LogMessage> logMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final logMessage in logMessages)
          Row(
            children: [
              Expanded(
                child: logMessage.getFormattedMessage(),
              ),
            ],
          ),
      ],
    );
  }
}
