import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/route/router.gr.dart' as autoRouter;
import 'package:BoilerPlateMVVM/ui/setup_dialogUI.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'core/locator.dart';
import 'package:flutter/material.dart';
import 'models/hive_Example/person.dart';
import 'ui/setup_snackbarUI.dart';
import 'ui/views/home/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(Environment.prod);
  print('environement is  ${Environment.prod}');
  setupDialogUi();
  setupSnackbarUi();
  Hive.registerAdapter(PersonAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: HomeView(),
      initialRoute: autoRouter.Routes.homeView,
      onGenerateRoute: autoRouter.Router().onGenerateRoute,
    );
  }
}
