import 'package:BoilerPlateMVVM/ui/views/dark/light_Theme/dark_light_view.dart';
import 'package:BoilerPlateMVVM/ui/views/multipleThemes/multiple_themes_view.dart';
import 'package:auto_route/auto_route_annotations.dart';
import '../../ui/views/home/home_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: HomeView,
    ),
    MaterialRoute(page: DarkLightView),
    MaterialRoute(page: MultipleThemesView),
    // initial route is named "/"
    //MaterialRoute(page: HomeView, initial: true)
  ],
)
class $Router {}
