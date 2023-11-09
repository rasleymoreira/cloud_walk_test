import 'package:cloud_walk_test/configurations/environment_config.dart';
import 'package:cloud_walk_test/gateway/model/url.dart';
import 'package:cloud_walk_test/gateway/util/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

abstract class AbstractGateway extends DioForNative {
  abstract final Url url;

  AbstractGateway() : super() {
    options = getBaseOptions();
    interceptors.addAll(
      _getInterceptors().whereType(),
    );
  }

  BaseOptions getBaseOptions() => BaseOptions(
    baseUrl: url.baseHost,
    sendTimeout: sendTimeout,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
  );

  List<Interceptor?> _getInterceptors() => [
    getLogger(),
    ...additionalInterceptors,
  ];

  List<Interceptor?> get additionalInterceptors => [];

  Interceptor getLogger() => PrettyDioLogger(
    requestHeader: true,
    queryParameters: true,
    requestBody: true,
    responseHeader: true,
    // ignore: avoid_redundant_argument_values
    responseBody: true,
    // ignore: avoid_redundant_argument_values
    error: true,
    // ignore: avoid_redundant_argument_values
    showProcessingTime: true,
    showCUrl: true,
    // ignore: avoid_redundant_argument_values
    canShowLog: EnvironmentConfig.isLoggingEnable,
  );
}
