// import 'package:Practice_Stacked/App/locator.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final GetIt locator = GetIt.instance;

@injectableInit
Future<void> setupLocator(String env) async {
  await $initGetIt(locator, environment: env);
}
