import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/Managers/LifeCycle/LifeCycleManger.dart';
import 'package:BoilerPlateMVVM/core/route/router.gr.dart' as autoRouter;
import 'package:BoilerPlateMVVM/core/Managers/ThemeManager/theme_builder.dart';
import 'package:BoilerPlateMVVM/ui/setup_dialogUI.dart';
import 'package:BoilerPlateMVVM/ui/views/dark/light_Theme/dark_light_view.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'core/locator.dart';
import 'package:flutter/material.dart';
import 'models/hive_Example/person.dart';
import 'theme_setup.dart';
import 'ui/setup_snackbarUI.dart';
import 'ui/views/home/home_view.dart';

Future<void> main() async {
  //NOTE  you pass the ensureInitialized to tell flutter to wait until everything is ok to start the app, if this is not your case you can use:
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(Environment.prod);
  Logger.level = Level.verbose;
  print('environement is  ${Environment.prod}');
  setupDialogUi();
  setupSnackbarUi();
  Hive.registerAdapter(PersonAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: ThemeBuilder(
        defaultThemeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.red[700],
          accentColor: Colors.red[700],
        ),
        lightTheme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.green[300],
          accentColor: Colors.blue[300],
        ),
        statusBarColorBuilder: (theme) => theme.accentColor,
        //NOTE FOR USING MULTIPLE THEMES USE THIS NOT THE LIGHT AND DARK MODE THEME
        // themes: getThemes(),
        builder: (context, selectedTheme, darkTheme, themeMode) => MaterialApp(
          title: 'Flutter Demo',
          theme: selectedTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: locator<NavigationService>().navigatorKey,
          // home: DarkLightView(),
          initialRoute: autoRouter.Routes.homeView,
          onGenerateRoute: autoRouter.Router().onGenerateRoute,
        ),
      ),
    );
  }
}
