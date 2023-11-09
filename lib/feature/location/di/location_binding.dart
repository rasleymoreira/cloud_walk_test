
import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/feature/location/controller/location_controller.dart';
import 'package:get_it/get_it.dart';

class LocationBinding extends AbstractBinding{
  @override
  Future<void> binding(GetIt it) async {
    it.registerFactory(
    () => LocationController(
        it()
      )
    );
  }

}