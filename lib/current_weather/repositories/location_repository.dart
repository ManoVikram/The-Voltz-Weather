import 'package:location/location.dart';
import 'package:open_weather_app/current_weather/models/models.dart';

import '../data_providers/device_location_client.dart';

class LocationRepository {
  const LocationRepository({required this.deviceLocationClient});

  final DeviceLocationClient deviceLocationClient;

  Future<DeviceLocation> fetchLocation() async {
    return await deviceLocationClient.fetchLocation();
  }
}
