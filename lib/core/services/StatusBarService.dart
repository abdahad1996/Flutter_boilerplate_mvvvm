import 'dart:ui';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:injectable/injectable.dart';

/// A service dedicated to changing the color of the status bar
@lazySingleton
class StatusBarService {
  Future updateStatusBarColor(Color statusBarColor) async {
    // Set status bar color
    await FlutterStatusbarcolor.setStatusBarColor(statusBarColor);

    // Check the constrast between the colors and set the status bar icons colors to white or dark
    if (useWhiteForeground(statusBarColor)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
