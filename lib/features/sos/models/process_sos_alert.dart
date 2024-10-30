import 'package:balatonivizeken/features/notification/notification.dart';
import 'package:balatonivizeken/features/sos/models/sos_alert.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../storage/user_storage/user_storage_provider/user_storage.provider.dart';

Future<void> processSosAlert(SosAlertDto sosAlert, Ref ref) async {
  final userStorage = ref.read(userStorageProvider);
  final user = await userStorage.getUser();
  if (user!.id != sosAlert.userId) {
    LocalNotifications.showSosNotification(sosDto: sosAlert);
  }
}