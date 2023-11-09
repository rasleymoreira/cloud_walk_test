import 'package:cloud_walk_test/feature/location/page/location_page.dart';
import 'package:cloud_walk_test/navigation/app_routers.dart';
import 'package:cloud_walk_test/navigation/base_navigation.dart';
import 'package:go_router/go_router.dart';

class LocationNavigation extends BaseNavigation{
  @override
  List<RouteBase> get listOfPages => [
    GoRoute(
      path: AppRouter.location.path,
      builder: (context, state) {
        return const LocationPage();
      },
    ),
  ];

}