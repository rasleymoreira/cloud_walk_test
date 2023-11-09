import 'package:cloud_walk_test/database/di/database_binding.dart';
import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/di/domain/domain_binding.dart';
import 'package:cloud_walk_test/di/repository/repository_binding.dart';
import 'package:cloud_walk_test/di/service/service_binding.dart';
import 'package:cloud_walk_test/feature/location/di/location_binding.dart';
import 'package:get_it/get_it.dart';

class AppDI {
  AppDI._();

  static final GetIt it = GetIt.instance;

  static final List<AbstractBinding> _listOfBasicInfrastructure = [
    DatabaseBinding(),
    ServiceBinding(),
    RepositoryBinding(),
    DomainBinding(),
  ];

  static final List<AbstractBinding> _getListOfBiding = [
    ..._listOfBasicInfrastructure,
    LocationBinding()
  ];

  static Future<void> setupBasicInfrastructure() async {
    for (final element in _listOfBasicInfrastructure) {
      await element.binding(it);
    }
  }

  static Future<void> setupDI() async {
    for (final element in _getListOfBiding) {
      await element.binding(it);
    }
  }

}