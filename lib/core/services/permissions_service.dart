import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class PermissionsService {
  // final Permission _permissionHandler = Permission();
  // Future<bool> get hasLocationPermission => null;

  // Future requestLocationPermission() async {}

  //ANCHOR generic method to ask for permission
  Future<bool> _requestPermission(Permission permission) async {
    final result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  /// Requests the users permission to read their contacts.
  // Future<bool> requestContactsPermission() async {
  //   return _requestPermission(Permission.contacts);
  // }

  //ANCHOR Requests the users permission to read their contacts.
  Future<bool> requestContactsPermission({Function onPermissionDenied}) async {
    final granted = await _requestPermission(Permission.contacts);
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }

  //ANCHOR Requests the users permission to read their location when the app is in use
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    final granted = await _requestPermission(Permission.locationWhenInUse);
    if (!granted) {
      onPermissionDenied();
    }

    return granted;
    // return _requestPermission(Permission.locationWhenInUse);
  }

  //ANCHOR generic function to check if the app has permission already
  Future<bool> hasPermission(Permission permission) async {
    final permissionStatus = await permission.status;
    return permissionStatus == PermissionStatus.granted;
  }

  //ANCHOR HAS CONTACT PERMISSION
  Future<bool> hasContactsPermission() async {
    return hasPermission(Permission.contacts);
  }
}
