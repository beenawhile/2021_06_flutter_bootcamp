import '../chain_of_responsibility.dart';

class ErrorLogger extends LoggerBase {
  late MailService mailService;

  ErrorLogger(LogBloc logBloc, [LoggerBase? nextLogger])
      : super(LogLevel.error, nextLogger) {
    mailService = MailService(logBloc: logBloc);
  }

  @override
  void log(String message) {
    mailService.sendErrorMail(logLevel, message);
  }
}
