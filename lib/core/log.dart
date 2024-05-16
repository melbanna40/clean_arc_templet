import 'package:logger/logger.dart';

abstract class Log {
  static final Logger _logger = Logger();

  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void error(dynamic message) {
    _logger.e(message);
  }

  static void information(dynamic message) {
    _logger.i(message);
  }

  static void warning(dynamic message) {
    _logger.w(message);
  }
}
