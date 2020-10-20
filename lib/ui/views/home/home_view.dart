library home_view;

import 'dart:ffi';

import 'package:BoilerPlateMVVM/core/services/logger/logger.dart';
import 'package:BoilerPlateMVVM/core/responsiveness/src/widget_builders.dart';
import 'package:BoilerPlateMVVM/ui/CachedImage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../CachedImage.dart';
import '../../../core/responsiveness/src/widget_builders.dart';
import 'home_view_model.dart';
part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {
          // Do something once your model is initialized
          print("initialized");
          // model.locationStream.listen((event) {
          //   print("location");
          model.delay();
          //   print(event.latitude);
          //   print(event.longitude);
          // });
          // model.getStreams().listen((event) {
          //   print("EVENT IS $event");
          // });
          // model.requestContactsPermission();
          // model.getStreams();
          // model.locationService.getLocation().then((value) =>
          //     {print("we are getting location is ${value.latitude}")});
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
            mobile: OrientationLayoutBuilder(
              landscape: (context) => _HomeMobileLandscape(model),
              portrait: (context) => _HomeMobilePortrait(model),
            ),
            desktop: _HomeDesktop(model),
            tablet: _HomeTablet(model),
          );
        });
  }
}
