import 'dart:convert';

import 'package:cloud_walk_test/database/database.dart';
import 'package:cloud_walk_test/model/location/req/location_req_dto.dart';
import 'package:cloud_walk_test/repository/geolocator/i_geolocator_repository.dart';
import 'package:cloud_walk_test/repository/location/i_location_repository.dart';
import 'package:cloud_walk_test/repository/location/impl/location_repository_impl.dart';
import 'package:cloud_walk_test/service/client/cloudwalk_client.dart';
import 'package:cloud_walk_test/service/client/logged/cloud_logged_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../database/impl/flutter_secure_storage_mock.dart';
import '../../database/impl/hive_mock.dart';
import 'mock/geolocator_mock.dart';

void main() {
  const testKey = 'TEST_KEY';
  const testValue = 'TEST_VALUE';
  const ip = '0.0.0.0';
  final encryptedKey = base64Url.encode('testEncryptedKey!MustBe32Chars!!'.codeUnits);

  final CloudWalkClient _client = CloudLoggedClient();
  final IGeoLocatorRepository _geoRepository = GeoLocatorMock();
  final db = Database(
      secureStorage: FlutterSecureStorageMock(
        containsKeyVar: Future.value(false),
        readVar: Future.value(encryptedKey),
      ),
      hive: const HiveMock()
  );
  final ILocationRepository _locRepository = LocationRepositoryImpl(_client, db, _geoRepository);

  TestWidgetsFlutterBinding.ensureInitialized();

  test("get location with all functions activated and airplane mode disabled", () async{
    final result = await _locRepository.getLocationByIP( const LocationReqDTO(query: ip), true, false);
    expect(result.lat != null && result.lon != null, true);
  });

  test("get location without gps", () async{
    final result = await _locRepository.getLocationByIP( const LocationReqDTO(query: ip), false, false);
    expect(result.lat != null && result.lon != null, true);
  });

  test("get location without gps and airplane mode ON", () async{
    final result = await _locRepository.getLocationByIP( const LocationReqDTO(query: ip), false, true);
    expect(result.lat != null && result.lon != null, true);
  });
}
