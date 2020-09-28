import 'dart:developer';

import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/enums/snackbar_type.dart';
// import 'package:Practice_Stacked/App/locator.dart';
// import 'package:Practice_Stacked/enum/snackbar_type.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get/get.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();
  
  // Registers a config to be used when calling showSnackbar
  
  
  // service.registerSnackbarConfig(SnackbarConfig(
  //   backgroundColor: Colors.blue,
  //   textColor: Colors.white,
  //   mainButtonTextColor: Colors.black,
  // ));
  
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.blueAndYellow,
    config: SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.yellow,
      borderRadius: 1,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.greenAndRed,
    config: SnackbarConfig(
      backgroundColor: Colors.white,
      titleColor: Colors.green,
      messageColor: Colors.red,
      borderRadius: 1,
    ),
  );
}