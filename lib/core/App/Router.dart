// import 'package:Practice_Stacked/UI/pages/Home/home.dart';
// import 'package:Practice_Stacked/UI/views/Home/home.dart';
// import 'package:Practice_Stacked/UI/views/address_selection/address_selection.dart';
// import 'package:Practice_Stacked/UI/pages/address_selection/address_selection.dart';
// import 'package:Practice_Stacked/UI/pages/dialog_UI/dialogUIView.dart';
// import 'package:Practice_Stacked/UI/pages/snackbarui/snackbarView.dart';
import 'package:BoilerPlateMVVM/ui/views/dark/light_Theme/dark_light_view.dart';
import 'package:BoilerPlateMVVM/ui/views/dialog_view.dart';
import 'package:BoilerPlateMVVM/ui/views/first_screen.dart';
import 'package:BoilerPlateMVVM/ui/views/home/home_view.dart';
import 'package:BoilerPlateMVVM/ui/views/home_screen.dart';
import 'package:BoilerPlateMVVM/ui/views/second_screen.dart';
import 'package:BoilerPlateMVVM/ui/views/snackbar_view.dart';

import 'package:BoilerPlateMVVM/ui/views/multipleThemes/multiple_themes_view.dart';
// import 'package:Practice_Stacked/ui/views/examples/Home/home.dart';
// import 'package:Practice_Stacked/ui/views/examples/address_selection/address_selection.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
   MaterialRoute(page: HomeScreen, initial: true),
   MaterialRoute(page: FirstScreen),
   MaterialRoute(page: SecondScreen),

    // MaterialRoute(page: DarkLightView, initial: true),
    // MaterialRoute(page: MultipleThemesView),
    MaterialRoute(page: SnackbarView,),
    MaterialRoute(page: DialogView,),


    // MaterialRoute(page: AddressSelectionView),
  ],
)
class $Router {}
