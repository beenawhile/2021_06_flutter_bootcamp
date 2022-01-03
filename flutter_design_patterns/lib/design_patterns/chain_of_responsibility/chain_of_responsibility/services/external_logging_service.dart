import '../chain_of_responsibility.dart';

class ExternalLoggingService {
  final LogBloc logBloc;
  const ExternalLoggingService({
    required this.logBloc,
  });

  void logMessage(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    // Send log message to the external logging service

    // Log message
    logBloc.log(logMessage);
  }
}
