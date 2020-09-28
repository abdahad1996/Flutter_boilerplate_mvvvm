// import 'package:BoilerPlate/app/Widgets/drawer-option/app_drawer_mobile.dart';
// import 'package:BoilerPlate/app/Widgets/drawer-option/drawer_option.dart';
// import 'package:BoilerPlate/app/responsiveness/responsive_builder.dart';
import 'package:BoilerPlateMVVM/core/responsiveness/src/widget_builders.dart';
import 'package:BoilerPlateMVVM/ui/widgets/drawer-option/app_drawer_mobile.dart';
import 'package:BoilerPlateMVVM/ui/widgets/drawer-option/drawer_option.dart';
import 'package:flutter/material.dart';
// import '../../responsiveness/orientation_layout.dart';
// import 'package:responsive_architecture/responsive/screen_type_layout.dart';
// import 'package:responsive_architecture/widgets/app_drawer/app_drawer_mobile.dart';
// import 'package:responsive_architecture/widgets/drawer_option/drawer_option.dart';
import 'app_drawer_tablet.dart';
 
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayoutBuilder(
        portrait: (context)=> AppDrawerTabletPortrait(),
        landscape: (context)=> AppDrawerTabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Images',
        iconData: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        iconData: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}


 