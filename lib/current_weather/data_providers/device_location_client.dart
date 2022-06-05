import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

import '../models/models.dart';

class DeviceLocationClient {
  DeviceLocationClient();

  final Location location = Location();

  Future<DeviceLocation> fetchLocation() async {
    // Getting permission from the user
    bool _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        throw Exception("Location Service not enabled by the user!");
      }
    }

    // Checking whether the user has given the permission to access the location
    PermissionStatus _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception(
            "The user haven't given permission for accessing the location!");
      }
    }

    // Getting the location
    LocationData _locationData = await location.getLocation();

    // Getting the area name from the latitude and longitude
    List<geo.Placemark> _placemarks = await geo.placemarkFromCoordinates(
        _locationData.latitude!, _locationData.longitude!);

    return DeviceLocation(
      latitude: _locationData.latitude!,
      longitude: _locationData.longitude!,
      area: _placemarks.first.locality!,
    );
  }
}
