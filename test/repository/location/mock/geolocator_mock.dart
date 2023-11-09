import 'package:cloud_walk_test/repository/geolocator/i_geolocator_repository.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

class GeoLocatorMock implements IGeoLocatorRepository{
  @override
  Future<Position> getCurrentPosition() async {
    return Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.timestamp(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0
    );
  }

}