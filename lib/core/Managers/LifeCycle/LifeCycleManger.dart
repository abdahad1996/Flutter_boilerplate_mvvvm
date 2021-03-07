import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/Themes/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  // List<StoppableService> servicesToManage = [
  //   locator<LocationService>(),
  //   locator<BackgroundFetchService>(),
  // ];

  // Get all services
  final themeService = locator<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // servicesToManage.forEach((service) {
    //   if (state == AppLifecycleState.resumed) {
    //     service.start();
    //   } else {
    //     service.stop();
    //   }
    // });
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        adjustSystemThemeIfNecessary();
        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState suspending');
        break;
    }
  }

  //NOTE: re-apply the appropriate theme when the application gets back into the foreground
  void adjustSystemThemeIfNecessary() {
    switch (themeService.selectedThemeMode) {
      //do nothing
      case ThemeManagerMode.dark:
        break;
      //do nothing
      case ThemeManagerMode.light:
        break;
      //reapply theme
      case ThemeManagerMode.system:
        print('reApplying system theme');
        themeService.setThemeMode(ThemeManagerMode.system);
        break;
      default:
    }
  }
}
