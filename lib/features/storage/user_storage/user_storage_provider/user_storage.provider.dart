import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:balatonivizeken/features/storage/storage_provider/storage.provider.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage.dart';

part 'user_storage.provider.g.dart';

@Riverpod(keepAlive: true)
UserStorage userStorage(UserStorageRef ref) {
  final storage = ref.read(storageProvider);
  return UserStorage(storage: storage);
}
