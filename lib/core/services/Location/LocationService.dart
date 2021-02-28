// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../logger/logger.dart';

@lazySingleton
class LocationService {
  Future<bool> get serviceEnabledOnDevice =>
      geolocator.isLocationServiceEnabled();

  bool getUserAllowPermissionStatus;

  final geolocator = GeolocatorPlatform.instance;
  StreamSubscription<Position> _positionStreamSubscription;
  final _positions = <Position>[];
  LocationService() {
    //NOTE: request permission
    try {
      geolocator.requestPermission().then((permission) {
        switch (permission) {
          case LocationPermission.denied:
            getUserAllowPermissionStatus = false;
            break;
          case LocationPermission.whileInUse:
            getUserAllowPermissionStatus = true;
            break;
          case LocationPermission.always:
            getUserAllowPermissionStatus = true;
            break;
          case LocationPermission.deniedForever:
            getUserAllowPermissionStatus = false;

            break;

          // default:
        }
      });
    } catch (e) {
      getUserAllowPermissionStatus = false;
      final log = getLogger("locationService", "locationService()");
      log.d("requesting permission error :$e");
    }
  }

  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        print("ERROR LISTENING $error");
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }).listen((position) => () => _positions.add(position));
      _positionStreamSubscription.pause();
    }

    if (_positionStreamSubscription.isPaused) {
      _positionStreamSubscription.resume();
    } else {
      _positionStreamSubscription.pause();
    }
  }

  checkCurrentPermssionStatus() async {
    try {
      final permission = await geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        getUserAllowPermissionStatus = false;
      }
      if (permission == LocationPermission.whileInUse) {
        getUserAllowPermissionStatus = true;
      }
      if (permission == LocationPermission.always) {
        getUserAllowPermissionStatus = true;
      }
      if (permission == LocationPermission.deniedForever) {
        getUserAllowPermissionStatus = false;
      }
    } catch (e) {
      getUserAllowPermissionStatus = false;
      final log = getLogger("locationService", "locationService()");
      log.d("requesting permission error :$e");
    }
  }

  // Stream<UserLocation> get locationStream => _locationController.stream;

  //Allow to get a one time position of the user. It will try to request permission if not granted yet
  // and will throw a PERMISSION_DENIED error code if
  //  permission still not granted.
  Future<Position> getCurrentLocation() async {
    final position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
//   //   try {
//   //     var userLocation = await location.getLocation();

//   //     _currentLocation = UserLocation(
//   //       latitude: userLocation.latitude,
//   //       longitude: userLocation.longitude,
//   //     );
//   //   } catch (e) {
//   //     print('Could not get the location: $e');
//   //   }

//   //   return _currentLocation;
//   // }
}
