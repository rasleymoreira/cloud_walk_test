import 'dart:convert';

import 'package:cloud_walk_test/database/database.dart';
import 'package:cloud_walk_test/database/util/abstract_flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'impl/flutter_secure_storage_mock.dart';
import 'impl/hive_mock.dart';

void main() {
  const testKey = 'TEST_KEY';
  const testValue = 'TEST_VALUE';
  final encryptedKey =
      base64Url.encode('testEncryptedKey!MustBe32Chars!!'.codeUnits);

  TestWidgetsFlutterBinding.ensureInitialized();

  // late WLDatabase db;
  setUpAll(() async {
    final AbstractFlutterSecureStorage secureStorage = FlutterSecureStorageMock(
      containsKeyVar: Future.value(false),
      readVar: Future.value(encryptedKey),
    );
    final db = Database(secureStorage: secureStorage, hive: const HiveMock());
    await db.init();
  });

  test('write Non Persistent data', () async {
    final AbstractFlutterSecureStorage secureStorage = FlutterSecureStorageMock(
      containsKeyVar: Future.value(false),
      readVar: Future.value(encryptedKey),
    );
    final db = Database(secureStorage: secureStorage, hive: const HiveMock());
    await db.write(testKey, testValue);

    expect(await db.read(testKey), testValue);
  });

  test('write non persistent data then clear', () async {
    final AbstractFlutterSecureStorage secureStorage = FlutterSecureStorageMock(
      containsKeyVar: Future.value(false),
      readVar: Future.value(encryptedKey),
    );
    final db = Database(secureStorage: secureStorage, hive: const HiveMock());
    await db.write(testKey, testValue);

    await db.clearNonPersistent();

    expect(await db.read(testKey), null);
  });

  test('write persistent data', () async {
    final AbstractFlutterSecureStorage secureStorage = FlutterSecureStorageMock(
      containsKeyVar: Future.value(false),
      readVar: Future.value(encryptedKey),
    );
    final db = Database(secureStorage: secureStorage, hive: const HiveMock());

    await db.write(testKey, testValue, persistent: true);

    await db.clearNonPersistent();

    expect(await db.read(testKey, persistent: true), testValue);
  });

  test('write persistent data then clear', () async {
    final AbstractFlutterSecureStorage secureStorage = FlutterSecureStorageMock(
      containsKeyVar: Future.value(false),
      readVar: Future.value(encryptedKey),
    );
    final db = Database(secureStorage: secureStorage, hive: const HiveMock());

    await db.write(testKey, testValue, persistent: true);

    await db.clearNonPersistent();

    expect(await db.read(testKey, persistent: true), testValue);
  });
}
