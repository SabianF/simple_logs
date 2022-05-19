library simple_logs;

import 'dart:developer';

import 'log_colour.dart';

/// Colourized logs for easier readability
class Log {

  /// Logs information (default: blue); lvl 0 severity
  /// 
  /// - An optional [object] can be appended to the end
  /// - An optional [logColour] can be specified (default: [LogColour.white])
  /// 
  /// Used for general events (e.g. starting functions, etc)
  static void info(String text, {
    Object object   = '',
    String logColour= LogColour.white,

  }) => log(
    '$logColour'
      '${DateTime.now()}: '
      'Info: $text'
    '${LogColour.end} '
    '$object',

    level: 0,
  );

  /// Logs information (green); level 0 severity
  /// 
  /// Typically used to show a function has completed with no issues
  static void success(String text, {
    Object object = '',

  }) => log(
    '${LogColour.green}'
      '${DateTime.now()}: '
      'Success: $text'
    '${LogColour.end} '
    '$object',

    level: 0,
  );

  /// Logs a warning (orange); lvl 1 severity
  /// 
  /// Typically used for failures that are handled or will not break anything
  static void warn(String text, {
    Object object = '',

  }) => log(
      '${LogColour.orange}'
        '${DateTime.now()}: '
        'Warning: $text'
      '${LogColour.end} '
      '$object',

      level: 1,
    );

  /// Logs an error (red); lvl 2 severity
  static void error(String text, {
    Object error = '',
    StackTrace? stackTrace,

  }) => log(
      '${LogColour.red}'
        '${DateTime.now()}: '
        'Error: $text'
      '${LogColour.end} '
      '$error',

    stackTrace: stackTrace ?? StackTrace.current,
    level     : 3,
  );
}
