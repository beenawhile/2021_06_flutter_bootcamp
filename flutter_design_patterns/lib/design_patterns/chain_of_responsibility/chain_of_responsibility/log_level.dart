enum LogLevel {
  debug,
  info,
  error,
}

extension LogLevelX on LogLevel {
  bool operator <=(LogLevel logLevel) => index <= logLevel.index;
}
