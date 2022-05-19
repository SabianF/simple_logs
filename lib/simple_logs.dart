library simple_logs;

import 'dart:developer';

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

class LogColour {
  static const String grey    = '\x1B[90m';
  static const String red     = '\x1B[31m';
  static const String orange  = '\x1B[33m';
  static const String green   = '\x1B[32m';
  static const String blue    = '\x1B[34m';
  static const String cyan    = '\x1B[36m';
  static const String cyan2   = '\x1B[96m';
  static const String white   = '\x1B[37m';
  static const String magenta = '\x1B[35m';
  static const String magenta2= '\x1B[95m';
  static const String end     = '\x1B[0m';
}
