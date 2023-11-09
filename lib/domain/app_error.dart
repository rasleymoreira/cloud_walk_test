import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable implements Exception {}

class Default extends AppError {
  final int? code;
  final String? title;
  final String? message;
  final String? serverCode;
  final Exception? exception;

  Default({
    this.code,
    this.serverCode,
    this.title,
    this.message,
    this.exception,
  });

  @override
  List<Object?> get props => [
        code,
        message,
        serverCode,
        exception,
      ];
}

class NetworkException extends AppError {
  final Exception? exception;

  NetworkException({this.exception});

  @override
  List<Object?> get props => [
        exception,
      ];
}

class UnknownException extends AppError {
  final dynamic exception;

  UnknownException({this.exception});

  @override
  List<Object?> get props => [
        exception,
      ];
}

extension AppErrorExt on AppError {
  String? get title {
    if (this is Default) {
      return (this as Default).title;
    }
    return null;
  }

  String? get message {
    if (this is Default) {
      return (this as Default).message;
    }
    return null;
  }
}
