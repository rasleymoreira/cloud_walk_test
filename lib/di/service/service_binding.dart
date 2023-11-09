import 'package:cloud_walk_test/di/abstract_binding.dart';
import 'package:cloud_walk_test/service/client/cloudwalk_client.dart';
import 'package:cloud_walk_test/service/client/logged/cloud_logged_client.dart';
import 'package:get_it/get_it.dart';

class ServiceBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<CloudWalkClient>(CloudLoggedClient());
  }
}
