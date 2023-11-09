import 'package:cloud_walk_test/feature/location/navigation/location_navigation.dart';
import 'package:cloud_walk_test/navigation/base_navigation.dart';
import 'package:cloud_walk_test/navigation/base_navigation_ext.dart';

class AppNavigations {
  AppNavigations._();

  static final listOfNavigation = <BaseNavigation>[
    LocationNavigation(),
  ].expandToMapperCloudWalkPage;
}