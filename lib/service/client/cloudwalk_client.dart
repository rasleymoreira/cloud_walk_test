import 'package:cloud_walk_test/gateway/abstract_gateway.dart';
import 'package:dio/dio.dart';

abstract class CloudWalkClient extends AbstractGateway {
  @override
  List<Interceptor?> get additionalInterceptors => [];
}