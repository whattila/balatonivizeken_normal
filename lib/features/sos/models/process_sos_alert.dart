import 'package:balatonivizeken/features/notification/notification.dart';
import 'package:balatonivizeken/features/sos/models/sos_alert.model.dart';

Future<void> processSosAlert(SosAlertDto sosAlert) async {
  // TODO: ahhoz hogy ellenőrizzük hogy mi küldtük-e a jelzést, le kell kérdezzük a felhasználót a UserStorage-ból
  // mivel viszont az providerben van, kell egy ref hozzá...
  LocalNotifications.showSosNotification(sosDto: sosAlert);
}