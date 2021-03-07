// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/Admob/AdmobService.dart';
import '../services/api.dart';
import '../services/CounterService.dart';
import '../services/hive_Service.dart';
import '../services/Inapp/inAppService.dart';
import '../services/Location/LocationService.dart';
import '../services/MediaService.dart';
import '../services/permissions_service.dart';
import '../services/postService.dart';
import '../services/SharedPreferencesService.dart';
import '../services/StatusBarService.dart';
import '../services/Themes/theme_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<AdmobService>(() => AdmobService());
  gh.lazySingleton<Api>(() => Api());
  gh.lazySingleton<BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<CounterService>(() => CounterService());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<HiveService>(() => HiveService());
  gh.lazySingleton<InAppService>(() => InAppService());
  gh.lazySingleton<LocationService>(() => LocationService());
  gh.lazySingleton<MediaService>(() => MediaService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<PermissionsService>(() => PermissionsService());
  gh.lazySingleton<PostsService>(() => PostsService());
  final sharedPreferencesService =
      await thirdPartyServicesModule.sharedPreferenceService;
  gh.factory<SharedPreferencesService>(() => sharedPreferencesService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<StatusBarService>(() => StatusBarService());
  gh.factory<ThemeService>(
      () => thirdPartyServicesModule.themePreferenceService);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  BottomSheetService get bottomSheetService => BottomSheetService();
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
