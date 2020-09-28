// import 'package:BoilerPlate/app/responsiveness/src/widget_builders.dart';
import 'package:BoilerPlateMVVM/core/responsiveness/src/widget_builders.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_architecture/responsive/orientation_layout.dart';
// import 'package:responsive_architecture/responsive/screen_type_layout.dart';

import 'drawer_option_mobile.dart';
import 'drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOption({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        landscape: (context) => DrawerOptionMobileLandscape(
          iconData: iconData,
        ),
        portrait: (context) => DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
        ),
      ),
      tablet: OrientationLayoutBuilder(
        portrait:(context) => DrawerOptionTabletPortrait(
          iconData: iconData,
          title: title,
        ),
        landscape: (context) => DrawerOptionMobilePortrait(
          iconData: iconData,
          title: title,
        ),
      ),
    );
  }
}
