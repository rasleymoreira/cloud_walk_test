import 'package:cloud_walk_test/model/location/req/location_req_dto.dart';
import 'package:cloud_walk_test/model/location/res/location_res_dto.dart';

abstract class ILocationRepository {
  Future<LocationResDTO> getLocationByIP(LocationReqDTO ip, bool isLocationServiceEnabled, bool airplaneModeStatus);
}