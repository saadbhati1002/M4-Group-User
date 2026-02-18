import 'package:logger/logger.dart';

/// Centralized logging service for M4 Group app.
/// Wraps the logger package with app-specific configuration.
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: Level.debug,
  );

  /// Log debug information
  static void d(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) =>
      d(message, error, stackTrace);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      e(message, error, stackTrace);

  /// Log informational messages
  static void i(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log warnings
  static void w(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log errors
  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log fatal errors
  static void f(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log WebView navigation events
  static void webview(String event, String url) {
    _logger.i('🌐 WebView [$event]: $url');
  }

  /// Log connectivity events
  static void connectivity(String status) {
    _logger.i('📡 Connectivity: $status');
  }
}
