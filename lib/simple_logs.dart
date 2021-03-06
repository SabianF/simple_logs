library simple_logs;

import 'dart:developer';

import 'log_colour.dart';

/// Colourized logs for easier readability
/// 
/// This is typically used to show helpful information during testing and
/// debugging in `VS Code`'s terminal. For other terminals, these colours were
/// not designed for them, so they may not look the same, but they should still
/// work.
/// 
/// Each log type has a standard colour associated with it, but the [info]
/// type's colour can be changed using any [LogColour] or any other valid 
/// [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code). Here's
/// [a helpful resource](https://www.kindacode.com/article/flutter-how-to-colorize-debug-console-logs/)
/// to understand how this works.
/// 
/// Optional [Object]s can be provided which get interpolated as [String]s
class Log {

  /// Logs information (default: blue); lvl 0 severity
  /// 
  /// - An optional [object] can be appended to the end
  /// - An optional [logColour] can be specified (default: [LogColour.white])
  /// 
  /// Used to display helpful info such as
  /// - identifying when functions start executing
  /// - identifying when different stages of functions begin/end
  /// - displaying objects returned from functions
  /// - and more
  static void info(String text, {
    Object object   = '',
    String logColour= LogColour.white,

  }) => _log(
    colour        : LogColour.white,
    text          : 'Info: $text',
    object        : object,
    severityLevel : 0,
  );

  /// Logs information (green); level 0 severity
  /// 
  /// - An optional [object] can be appended to the end
  /// 
  /// Typically used to show a function has completed with no issues
  static void success(String text, {
    Object object = '',

  }) => _log(
    colour        : LogColour.green,
    text          : 'Success: $text',
    object        : object,
    severityLevel : 0,
  );

  /// Logs a warning (orange); lvl 1 severity
  /// 
  /// - An optional [object] can be appended to the end
  /// 
  /// Typically used for exceptions or failures that are handled or do not
  /// necessarily break anything
  static void warn(String text, {
    Object object = '',

  }) => _log(
    colour        : LogColour.orange,
    text          : 'Warning: $text',
    object        : object,
    severityLevel : 1,
  );

  /// Logs an error (red); lvl 2 severity
  static void error(String text, {
    Object error = '',
    StackTrace? stackTrace,

  }) => _log(
    colour        : LogColour.red,
    text          : 'Error: $text',
    object        : error,
    stack         : stackTrace ?? StackTrace.current,
    severityLevel : 3,
  );

  static void _log({
    required String colour,
    required String text,
    required int severityLevel,
    dynamic object = '',
    StackTrace? stack,

  }) => log(
    '$colour'
      '${DateTime.now()}: '
      '$text'
    '${LogColour.end} '
    '$object',

    stackTrace: stack,
    level     : severityLevel,
  );
}
