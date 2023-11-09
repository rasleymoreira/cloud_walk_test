import 'package:cloud_walk_test/common/helper/app_typedef.dart';
import 'package:cloud_walk_test/common/message/generic_message.dart';
import 'package:cloud_walk_test/common/util/cast.dart';
import 'package:cloud_walk_test/common/util/either_helpers.dart';
import 'package:cloud_walk_test/common/util/logger.dart';
import 'package:cloud_walk_test/domain/abstract_use_case.dart';
import 'package:cloud_walk_test/domain/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class BaseController {
  RxNotifier<bool?>? _goToInitialPage;
  RxNotifier<bool?>? _isLoading;

  BaseController();

  RxNotifier<GenericMessage?>? _message;
  GenericMessage? get message => _message?.value;
  set message(GenericMessage? value) => _message?.value = value;

  bool? get isLoading => _isLoading?.value;

  set isLoading(bool? value) => _isLoading?.value = value;

  bool? get goToInitialPage => _goToInitialPage?.value;

  set goToInitialPage(bool? value) => _goToInitialPage?.value = value;

  void onInit() {
    _goToInitialPage = RxNotifier(null);
    _isLoading = RxNotifier(null);
  }

  @mustCallSuper
  Future<void> dispose() async {
    _goToInitialPage?.dispose();
    _isLoading?.dispose();
  }

  Future<R?> execSingle<P, R>(P value,
      AbstractUseCase<P, R> useCase, {
        CallBackError? mapError,
        bool showLoading = true,
        bool? forceRefresh = false,
      }) async {
    if (showLoading) {
      isLoading = true;
    }
    try {
      final Either<AppError, R> result = await useCase(
          value, forceRefresh: forceRefresh ?? false);
      if (result.isLeft()) {
        _resolveError(result, mapError);
      } else {
        return result.unwrapRight;
      }
    } catch (e) {
      logger.d(e);
      message = ErrorMessage(error: e.castOrNull());
    } finally {
      if (showLoading) {
        isLoading = false;
      }
    }
    return null;
  }

  Future<void> _resolveError(Either<AppError, dynamic> result,
      CallBackError? mapError) async {
    final AppError? error = result.unwrapLeft;
  }
}
