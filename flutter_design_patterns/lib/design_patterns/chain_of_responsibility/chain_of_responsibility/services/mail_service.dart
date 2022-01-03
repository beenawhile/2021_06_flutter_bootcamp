import '../chain_of_responsibility.dart';

class MailService {
  final LogBloc logBloc;
  const MailService({
    required this.logBloc,
  });

  void sendErrorMail(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    // Send error email

    // Log message
    logBloc.log(logMessage);
  }
}
