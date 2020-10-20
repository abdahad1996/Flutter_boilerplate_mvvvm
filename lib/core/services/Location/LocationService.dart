// ignore: file_names
import 'dart:async';
import 'dart:html';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
// import 'package:location/location.dart';

import '../logger/logger.dart';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}

@lazySingleton
class LocationService {
  // bool _serviceEnabled;
  // // PermissionStatus _permissionGranted;
  // // Keep track of current Location
  // UserLocation _currentLocation;
  // // Location location = Location();
  // // Continuously emit location updates
  final geolocator = GeolocatorPlatform.instance;
  // StreamController<UserLocation> _locationController =
  //     StreamController<UserLocation>.broadcast();
  StreamSubscription<Position> _positionStreamSubscription;
  final _positions = <Position>[];
  LocationService() {
    //NOTE: ask permission
    geolocator.checkPermission().then((permission) => {
      switch (permission) {
        case LocationPermission.denied:
          break;
        case LocationPermission.whileInUse:
          break;
        case LocationPermission.always:
          break;
        case LocationPermission.whileInUse:
          break;

        // default:
      }
    });
    
    // geolocator.isLocationServiceEnabled().then((isGranted) {

    // });
    // location.requestPermission().then((granted) {
    //   final log = getLogger("locationService", "locationService()");
    //   switch (granted) {
    //     case PermissionStatus.denied:
    //       break;
    //     case PermissionStatus.granted:
    //       try {
    //         location.onLocationChanged.handleError((dynamic onError) {
    //           print('handleError location: $onError');
    //         }).listen((locationData) {
    //           print("LOCATIONDATAAA");
    //           if (locationData != null) {
    //             log.d("location is valid :$locationData");

    //             ///You can also get continuous callbacks when your position is changing:
    //             _locationController.add(UserLocation(
    //               latitude: locationData.latitude,
    //               longitude: locationData.longitude,
    //             ));
    //           } else {
    //             log.d("location is null");
    //             _locationController.addError("SOMESORT OF ERROR");
    //           }
    //         }, onError: () {
    //           log.d("error in stream ");
    //         }, onDone: () {
    //           log.d("done stream ");
    //         });
    //       } catch (e) {
    //         print('Could not get the location: $e');
    //       }

    //       break;
    //     case PermissionStatus.deniedForever:
    //       break;
    //     default:
    //   }
    //   // if (granted == PermissionStatus.granted) {
    //   //   location.onLocationChanged.listen((locationData) {
    //   //     if (locationData != null) {
    //   //       _locationController.add(UserLocation(
    //   //         latitude: locationData.latitude,
    //   //         longitude: locationData.longitude,
    //   //       ));
    //   //     }
    //   //   });
    //   // }
    // });
  }

  // Stream<UserLocation> get locationStream => _locationController.stream;

  //Allow to get a one time position of the user. It will try to request permission if not granted yet
  // and will throw a PERMISSION_DENIED error code if
  //  permission still not granted.
//   Future<UserLocation> getLocation() async {
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
