import 'package:cloud_walk_test/configurations/profile.dart';
import 'package:cloud_walk_test/gateway/model/url.dart';
import 'package:cloud_walk_test/gateway/urls.dart';

Url serverUrl() {
  switch (getProfileFromEnvironmentConfig()) {
    case Profile.dev:
      return Urls.ipApi;
    case Profile.hml:
      return Urls.ipApi;
    case Profile.prod:
      return Urls.ipApi;
    default:
      return Urls.ipApi;
  }
}