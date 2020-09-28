library bottomnavigation_widget;
import 'package:BoilerPlateMVVM/core/responsiveness/src/widget_builders.dart';
// import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
part 'bottomnavigation_mobile.dart';
part 'bottomnavigation_tablet.dart';
part 'bottomnavigation_desktop.dart';
class BottomnavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _BottomnavigationMobile(),
        desktop: _BottomnavigationDesktop(),
        tablet: _BottomnavigationTablet(),
    );
  }
}