import 'package:cloud_walk_test/navigation/base_navigation.dart';
import 'package:go_router/go_router.dart';

extension BaseNavigationListExt on List<BaseNavigation> {
  List<RouteBase> get expandToMapperCloudWalkPage => <RouteBase>[for (final map in this) ...map.listOfPages];
}
