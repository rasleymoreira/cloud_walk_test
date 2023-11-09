import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/repository/geolocator/i_geolocator_repository.dart';
import 'package:cloud_walk_test/repository/geolocator/impl/geolocator_repository_impl.dart';
import 'package:cloud_walk_test/repository/location/i_location_repository.dart';
import 'package:cloud_walk_test/repository/location/impl/location_repository_impl.dart';
import 'package:get_it/get_it.dart';

class RepositoryBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<IGeoLocatorRepository>(GeoLocatorRepositoryImpl());
    it.registerSingleton<ILocationRepository>(LocationRepositoryImpl(it(), await it.getAsync(), it()));
  }

}