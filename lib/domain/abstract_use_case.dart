import 'package:cloud_walk_test/common/util/logger.dart';
import 'package:cloud_walk_test/domain/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AbstractUseCase<PARAM, RESULT> {
  const AbstractUseCase();

  String? get key => null;

  Future<RESULT> execute(PARAM param);

  Future<Either<AppError, RESULT>> call(
    PARAM params, {
    bool forceRefresh = false,
  }) async {
    try {
      final result = await execute(params);
      return Right(result);
    } on DioError catch (exception, stacktrace) {
      logger.e(exception, time: DateTime.now(), error: exception, stackTrace: stacktrace);
      return Left(NetworkException(exception: exception));
    } catch (exception, stacktrace) {
      logger.e(exception, time: DateTime.now(), error: exception, stackTrace: stacktrace);
      return Left(UnknownException(exception: exception));
    }
  }
}
