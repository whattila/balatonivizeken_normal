import 'dart:convert';
import 'dart:async';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../sos/models/sos_alert.model.dart';

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final StreamController<StormDto> stormNotificationStream = StreamController<StormDto>.broadcast();
  static final StreamController<SosAlertDto> sosNotificationStream = StreamController<SosAlertDto>.broadcast();
  static const int simpleNotificationId = 0;
  static const int stormNotificationId = 1;
  static const int sosNotificationId = 2;

// initialize the local notifications
  static Future init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    // TODO: final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(...);
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO: iOS: initializationSettingsDarwin
    );
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground
    );
  }

  // show a simple notification
  static Future showSimpleNotification({required String title, required String body,}) async {
    await _showNotification(simpleNotificationId, title, body, '');
  }

  static Future showStormNotification({required StormDto stormDto}) async {
    await _showNotification(stormNotificationId, stormDto.area, 'Vihar!', jsonEncode(stormDto.toJson()));
  }
  
  static Future showSosNotification({required SosAlertDto sosDto}) async {
    await _showNotification(sosNotificationId, 'Segélykérés az Ön közelében!', 'Nézze meg a részleteket', jsonEncode(sosDto.toJson()));
  }

  static Future<void> _showNotification(int id, String title, String body, String payload) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('your channel id', 'your channel name', channelDescription: 'your channel description', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
        // TODO: iOS
    );
    await _flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: payload);
  }

  static Future<NotificationAppLaunchDetails?> getNotificationAppLaunchDetails() async {
    return await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  }

  // close a specific channel notification
  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // close all the notifications available
  static Future cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  switch(notificationResponse.id) {
    case LocalNotifications.stormNotificationId:
      final storm = StormDto.fromJson(jsonDecode(notificationResponse.payload!) as Map<String, dynamic>);
      LocalNotifications.stormNotificationStream.add(storm);
      break;
    case LocalNotifications.sosNotificationId:
      final sos = SosAlertDto.fromJson(jsonDecode(notificationResponse.payload!) as Map<String, dynamic>);
      LocalNotifications.sosNotificationStream.add(sos);
      break;
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // TODO: handle action
}
