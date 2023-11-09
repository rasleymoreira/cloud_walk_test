
import 'package:cloud_walk_test/database/database.dart';
import 'package:cloud_walk_test/model/location/res/location_res_dto.dart';

extension DatabaseCacheExt on Database{

  static const String _lacation = "_location";

  Future<void> saveLatLng(LocationResDTO value) async {
    write(_lacation, value);
  }

  Future<LocationResDTO> getCache() async {
    final location = await read<LocationResDTO>(_lacation);
    if (location != null) {
      return location;
    } else {
      return const LocationResDTO();
    }
  }
}