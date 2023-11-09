import 'package:airplane_mode_checker/airplane_mode_checker.dart';
import 'package:cloud_walk_test/domain/abstract_use_case.dart';
import 'package:cloud_walk_test/model/location/req/location_req_dto.dart';
import 'package:cloud_walk_test/model/location/res/location_res_dto.dart';
import 'package:cloud_walk_test/repository/location/i_location_repository.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationUseCase extends AbstractUseCase<LocationReqDTO, LocationResDTO> {
  final ILocationRepository _repository;
  const GetLocationUseCase(this._repository);
  @override
  Future<LocationResDTO> execute(LocationReqDTO param) async {
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    final airplaneModeStatus = await AirplaneModeChecker.checkAirplaneMode();

    return _repository.getLocationByIP(param, isLocationServiceEnabled, airplaneModeStatus == AirplaneModeStatus.on);
  }
}