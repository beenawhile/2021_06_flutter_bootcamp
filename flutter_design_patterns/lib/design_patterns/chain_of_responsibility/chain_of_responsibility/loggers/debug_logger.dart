import '../chain_of_responsibility.dart';

class DebugLogger extends LoggerBase {
  final LogBloc logBloc;

  DebugLogger(this.logBloc, [LoggerBase? nextLogger])
      : super(LogLevel.debug, nextLogger);

  @override
  void log(String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    logBloc.log(logMessage);
  }
}
