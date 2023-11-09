import 'package:cloud_walk_test/gateway/model/url.dart';
import 'package:cloud_walk_test/service/client/cloudwalk_client.dart';
import 'package:cloud_walk_test/service/url/util_ext.dart';

class CloudLoggedClient extends CloudWalkClient {
  @override
  Url get url => serverUrl();

  static final CloudLoggedClient _client = CloudLoggedClient._internal();

  factory CloudLoggedClient() => _client;

  CloudLoggedClient._internal();

}