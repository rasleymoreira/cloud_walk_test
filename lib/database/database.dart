import 'dart:convert';
import 'package:cloud_walk_test/configurations/constants.dart';
import 'package:cloud_walk_test/configurations/profile.dart';
import 'package:cloud_walk_test/database/util/abstract_flutter_secure_storage.dart';
import 'package:cloud_walk_test/database/util/abstract_hive.dart';
import 'package:cloud_walk_test/database/util_impl/flutter_secure_storage_impl.dart';
import 'package:cloud_walk_test/database/util_impl/hive_impl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'exception/cloudwalk_database_encryption_key_exception.dart';

class Database {
  factory Database({AbstractFlutterSecureStorage? secureStorage, AbstractHive? hive}) => _shared
    .._hive = (_shared._hive ?? hive ?? const HiveImpl())
    .._secureStorage = (_shared._secureStorage ?? secureStorage ?? const FlutterSecureStorageImpl());

  Database._internal();

  static late final _shared = Database._internal();
  AbstractHive? _hive;
  AbstractFlutterSecureStorage? _secureStorage;
  Box? _box, _persistentBox;

  bool Function(int, int) get _strategy => (entries, deletedEntries) => deletedEntries > 50;

  Future<void> init() async {
    await _hive?.init(databaseFolder);
    final encryptedKey = await _getEncryptedKey();
    final encryptionKey = base64Url.decode(encryptedKey);
    _box = await _hive?.openBox(nonPersistentDatabase, HiveAesCipher(encryptionKey), _strategy);
    _persistentBox = await _hive?.openBox(persistentDatabase, HiveAesCipher(encryptionKey), _strategy);
  }

  Future<String> _getEncryptedKey() async {
    try {
      if (false == await _secureStorage?.containsKey(key: cryptoKeyName)) {
        await _secureStorage?.write(key: cryptoKeyName, value: base64Url.encode(cryptoKey.codeUnits));
      }
      final key = await _secureStorage?.read(key: cryptoKeyName);
      if (key == null) throw CloudWalkDatabaseEncryptionKeyException();
      return key;
    } catch (_) {
      if (getProfileFromEnvironmentConfig() != Profile.prod) {
        return base64Url.encode('00000000000000000000000000000000'.codeUnits);
      }
      throw CloudWalkDatabaseEncryptionKeyException();
    }
  }

  Future<T?> read<T>(String key, {bool persistent = false}) => persistent ? readPersistent(key) : readNonPersistent(key);

  Future<void> write(String key, dynamic value, {bool persistent = false}) => persistent ? writePersistent(key, value) : writeNonPersistent(key, value);

  Future<T?> readNonPersistent<T>(String key) async => await _box?.get(key) as T?;

  Future<T?> readPersistent<T>(String key) async => await _persistentBox?.get(key) as T?;

  Future<void> writeNonPersistent(String key, dynamic value) async => await _box?.put(key, value);

  Future<void> writePersistent(String key, dynamic value) async => await _persistentBox?.put(key, value);

  Future<void> clearNonPersistent() async => await _box?.clear();

  Future<void> deleteByKeyNonPersistent(String key) async {
    return await _box?.delete(key);
  }

  Future<void> close() async {
    await _box?.close();
    await _persistentBox?.close();
  }
}
