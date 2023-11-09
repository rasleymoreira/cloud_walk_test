import 'package:cloud_walk_test/database/database.dart';
import 'package:cloud_walk_test/database/util/abstract_flutter_secure_storage.dart';
import 'package:cloud_walk_test/database/util/abstract_hive.dart';
import 'package:cloud_walk_test/database/util_impl/flutter_secure_storage_impl.dart';
import 'package:cloud_walk_test/database/util_impl/hive_impl.dart';
import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/di/app_di.dart';
import 'package:get_it/get_it.dart';

class DatabaseBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<AbstractFlutterSecureStorage>(const FlutterSecureStorageImpl());
    it.registerSingletonAsync<AbstractHive>(() async => _createHive());

    it.registerSingletonAsync<Database>(() async => _createDatabase(it));
  }

  Future<Database> _createDatabase(GetIt it) async {
    final database = Database(
      secureStorage: AppDI.it.get<AbstractFlutterSecureStorage>(),
      hive: await AppDI.it.getAsync<AbstractHive>(),
    );
    await database.init();
    return database;
  }

  Future<HiveImpl> _createHive() async {
    const hive = HiveImpl();
    await hive.init();
    return hive;
  }

}