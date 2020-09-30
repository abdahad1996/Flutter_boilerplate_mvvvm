// import 'package:BoilerPlateMVVM/core/App/locator.iconfig.dart';
// import 'package:Practice_Stacked/App/locator.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);
