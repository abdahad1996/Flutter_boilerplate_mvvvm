import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/Themes/theme_service.dart';
import 'package:stacked/stacked.dart';

class DarkLightViewModel extends BaseViewModel {
  final themeService = locator<ThemeService>();

  void getPrint(int index) {
    print(themeService.isDarkMode);
  }
}
