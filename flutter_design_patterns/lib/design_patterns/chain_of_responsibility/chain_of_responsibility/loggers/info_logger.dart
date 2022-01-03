import '../chain_of_responsibility.dart';

class InfoLogger extends LoggerBase {
  late ExternalLoggingService externalLoggingService;

  InfoLogger(LogBloc logBloc, [LoggerBase? nextLogger])
      : super(
          LogLevel.info,
          nextLogger,
        ) {
    externalLoggingService = ExternalLoggingService(logBloc: logBloc);
  }

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}
