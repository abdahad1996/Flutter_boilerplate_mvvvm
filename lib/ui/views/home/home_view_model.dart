import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/permissions_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final permissionService = locator<PermissionsService>();
  HomeViewModel();

  Future<bool> requestContactsPermission() async {
    final IsGranted = await permissionService.requestContactsPermission(
        onPermissionDenied: () => {print("permission denied")});
    return IsGranted;
  }
}
