import 'dart:math';

import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/Location/LocationService.dart';
import 'package:BoilerPlateMVVM/core/services/permissions_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final permissionService = locator<PermissionsService>();
  final locationService = locator<LocationService>();
  HomeViewModel();

  Future<void> delay() async {
    setBusy(true);
    Future.delayed(const Duration(milliseconds: 5000), () {
      setBusy(false);
    });
  }

  Future<bool> requestContactsPermission() async {
    final IsGranted = await permissionService.requestContactsPermission(
        onPermissionDenied: () => {print("permission denied")});
    return IsGranted;
  }

  // getStreams() {
  //   locationService.locationStream.listen((data) {
  //     print("DataReceived: " + data.latitude.toString());
  //   }, onDone: () {
  //     print("Task Done");
  //   }, onError: (error) {
  //     print("Some Error");
  //   });
  // }
}
