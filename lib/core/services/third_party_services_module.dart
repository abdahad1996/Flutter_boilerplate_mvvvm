import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

//NOTE Modules are helpful when you need to provide a third part package like SharedPreferences or Dio
@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackBarService;
  //NOTE ou can also use the @preResolve annotation when you have a async instance like SharedPreferences so GetIt will await for the resolution of this instance to continue
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
