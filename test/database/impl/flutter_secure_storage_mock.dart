import 'package:cloud_walk_test/database/util/abstract_flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageMock extends AbstractFlutterSecureStorage {
  final Future<bool> containsKeyVar;
  final Future<String?> readVar;

  const FlutterSecureStorageMock(
      {required this.containsKeyVar, required this.readVar});

  @override
  Future<bool> containsKey({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) =>
      containsKeyVar;

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) =>
      readVar;

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) =>
      Future.value();
}
