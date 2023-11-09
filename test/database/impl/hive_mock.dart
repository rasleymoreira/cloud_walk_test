import 'package:cloud_walk_test/database/util/abstract_hive.dart';
import 'package:hive/hive.dart';

class HiveMock extends AbstractHive {
  const HiveMock();

  @override
  Future<void> init([String? subDir]) async {
    Hive.init('dbtest');
  }

  @override
  Future<Box<E>> openBox<E>(String name, HiveCipher encryptionCipher,
      bool Function(int entries, int deletedEntries) strategy) async {
    return Hive.openBox(name,
        encryptionCipher: encryptionCipher, compactionStrategy: strategy);
  }
}
