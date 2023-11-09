import 'package:cloud_walk_test/common/base/base_controller.dart';
import 'package:cloud_walk_test/domain/location/get_location_use_case.dart';
import 'package:cloud_walk_test/model/location/req/location_req_dto.dart';
import 'package:cloud_walk_test/model/location/res/location_res_dto.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_notifier/rx_notifier.dart';

class LocationController extends BaseController {

  final GetLocationUseCase _getLocationUseCase;

  final RxNotifier<LocationResDTO?> location = RxNotifier(null);

  LocationController(
      this._getLocationUseCase
  );

  Future<void> getLocation({bool forceReload = false}) async {
    if(await Geolocator.checkPermission() != true){
      await Geolocator.requestPermission();
    }

    final myIp = await gettingIP();
    final result = await execSingle(LocationReqDTO(query: myIp ?? "", forceReload: forceReload,), _getLocationUseCase,);
    location.value = result;
  }

  Future<String?> gettingIP() async{
    return Ipify.ipv4();
  }
}
