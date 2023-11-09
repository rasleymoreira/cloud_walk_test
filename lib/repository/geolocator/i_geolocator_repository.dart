import 'package:geolocator/geolocator.dart';

abstract class IGeoLocatorRepository {
  Future<Position> getCurrentPosition();
}