import 'dart:developer' as prefix0;
import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  static int counter = 0;
  final String className;
  final String methodName;
  SimpleLogPrinter(this.className, this.methodName);

  @override
  // ignore: missing_return
  // ignore: type_annotate_public_apis
  // ignore: always_declare_return_types
  // log(LogEvent event) {
  //   var color = PrettyPrinter.levelColors[event.level];
  //   var emoji = PrettyPrinter.levelEmojis[event.level];
  //   print(color('$emoji $className - $methodName - ${event.message}'));
  // }

  // ignore: missing_return
  log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    print(color('$emoji $className - $methodName - ${event.message}'));

    // prefix0.log(
    //   event.message,
    //   time: DateTime.now(),
    //   level: () {
    //     switch (event.level) {
    //       case Level.verbose:
    //         return 0;
    //       case Level.debug:
    //         return 500;
    //       case Level.info:
    //         return 0;
    //       case Level.warning:
    //         return 1500;
    //       case Level.error:
    //         return 2000;
    //       case Level.wtf:
    //         return 2000;
    //       default:
    //         return 2000;
    //     }
    //   }(),
    //   name: className,
    //   error: event.error,
    //   sequenceNumber: counter += 1,
    // );
  }
}

//NOTE: use this when logging
Logger getLogger_Function(String className, String functionName) {
  return Logger(printer: SimpleLogPrinter(className, functionName));
}

Logger getLogger(String className, String s, {String functionName = ""}) {
  return Logger(printer: SimpleLogPrinter(className, functionName));
}
