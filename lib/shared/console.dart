import 'package:flutter/foundation.dart';

void console(var value, {LogColors color = LogColors.green}) {
  if (kDebugMode) {
    print(value);
    // log('${colors[color]}$value\x1B[0m', name: "Log");
  }
}

enum LogColors { black, red, green, yellow, blue, magenta, cyan, white }

const Map<LogColors, String> colors = {
  LogColors.black: "\x1B[30m",
  LogColors.red: "\x1B[31m",
  LogColors.green: "\x1B[32m",
  LogColors.yellow: "\x1B[33m",
  LogColors.blue: "\x1B[34m",
  LogColors.magenta: "\x1B[35m",
  LogColors.cyan: "\x1B[36m",
  LogColors.white: "\x1B[37m",
};
