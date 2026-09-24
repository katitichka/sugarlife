import 'dart:developer' as developer;

/// Единая точка записи служебных логов приложения.
abstract final class AppLogger {
  const AppLogger._();

  static void error(
    String message,
    Object error,
    StackTrace stackTrace,
    String tag,
  ) {
    developer.log(
      message,
      name: tag,
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }
}
