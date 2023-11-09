import 'package:cloud_walk_test/common/util/logger.dart';
import 'package:cloud_walk_test/database/database.dart';
import 'package:cloud_walk_test/database/ext/database_cache_ext.dart';
import 'package:cloud_walk_test/domain/app_error.dart';
import 'package:cloud_walk_test/model/location/req/location_req_dto.dart';
import 'package:cloud_walk_test/model/location/res/location_res_dto.dart';
import 'package:cloud_walk_test/repository/geolocator/i_geolocator_repository.dart';
import 'package:cloud_walk_test/repository/location/i_location_repository.dart';
import 'package:cloud_walk_test/service/client/cloudwalk_client.dart';
import 'package:cloud_walk_test/service/endpoint/endpoints.dart';

class LocationRepositoryImpl extends ILocationRepository {
  final CloudWalkClient _client;
  final IGeoLocatorRepository _geoLocatorRepository;
  final Database _database;

  LocationRepositoryImpl(this._client, this._database, this._geoLocatorRepository);

  @override
  Future<LocationResDTO> getLocationByIP(LocationReqDTO ip, bool isLocationServiceEnabled, bool isAirplaneMode) async {
    LocationResDTO location = const LocationResDTO();

    if (isLocationServiceEnabled) {
      try {
        final position = await _geoLocatorRepository.getCurrentPosition();
        location = LocationResDTO(lat: position.latitude, lon: position.longitude);
      } catch (e) {
        logger.d("Error on get the LatLng from GPS");
        throw UnknownException(exception: "Error on get the LatLng from GPS");
      }
    } else if (isAirplaneMode){
       location = await _database.getCache();
    } else {
      try {
        final response = await _client.get("${Endpoints.getLocationInformation}/${ip.query}");
        location = LocationResDTO.fromJson((response.data as Map<String, dynamic>?) ?? {});
      } catch(e) {
        logger.d("Error on get the LatLng from API");
        throw UnknownException(exception: "Error on get the LatLng from API");
      }
    }

    //await saveCache(location);

    return location;
  }

  Future<void> saveCache(LocationResDTO locationResDTO) async {
    await _database.saveLatLng(locationResDTO);
  }

}