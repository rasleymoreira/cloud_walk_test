import 'package:cloud_walk_test/repository/geolocator/i_geolocator_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorRepositoryImpl extends IGeoLocatorRepository {
  GeoLocatorRepositoryImpl();

  @override
  Future<Position> getCurrentPosition() async => Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

}