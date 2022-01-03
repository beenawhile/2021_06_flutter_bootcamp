import 'package:flutter/material.dart';

import 'chain_of_responsibility.dart';

class LogMessage {
  final LogLevel logLevel;
  final String message;

  const LogMessage({
    required this.logLevel,
    required this.message,
  });

  String get _logLevelString =>
      logLevel.toString().split(".").last.toUpperCase();

  Color _getLogEntryColor() {
    switch (logLevel) {
      case LogLevel.debug:
        return Colors.grey;
      case LogLevel.info:
        return Colors.blue;
      case LogLevel.error:
        return Colors.red;
      default:
        throw Exception("Log level '$logLevel' is not supported.");
    }
  }

  Widget getFormattedMessage() {
    return Text(
      "$_logLevelString: $message",
      style: TextStyle(
        color: _getLogEntryColor(),
      ),
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
