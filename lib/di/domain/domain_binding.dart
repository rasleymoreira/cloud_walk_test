import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/domain/location/get_location_use_case.dart';
import 'package:get_it/get_it.dart';

class DomainBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton(GetLocationUseCase(it()));
  }
}