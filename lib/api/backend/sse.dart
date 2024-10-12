import 'dart:convert';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storm/models/process_storm_alert.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import '../../features/sos/models/process_sos_alert.dart';
import '../../features/sos/models/sos_alert.model.dart';
import '../../features/storm/models/storm.model.dart';

bool _isManuallyUnsubscribed = false;

void subscribeToStormAlerts(
    String accessToken, {
    required void Function(StormDto stormAlert) onEvent,
    required void Function() onError
}) {
  _isManuallyUnsubscribed = false;  // Reseteljük a flag-et
  SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://10.0.2.2:3000/storm/alerts',
      header: {
        "Authorization": "Bearer $accessToken"
      }
  ).listen(
      (event) => onEvent(StormDto.fromJson(jsonDecode(event.data ?? '') as Map<String, dynamic>)),
      onError: (error) {
        if (!_isManuallyUnsubscribed) {  // Csak akkor hívódjon meg, ha nem manuális leiratkozás történt
          onError();
        }
      }
  );
}

void subscribeToSosAlerts(
    String accessToken, {
    required void Function(SosAlertDto sosAlertDto) onEvent,
    required void Function() onError
}) {
  _isManuallyUnsubscribed = false;  // Reseteljük a flag-et
  SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://10.0.2.2:3000/sos/alerts',
      header: {
        "Authorization": "Bearer $accessToken"
      }
  ).listen(
      (event) => onEvent(SosAlertDto.fromJson(jsonDecode(event.data ?? '') as Map<String, dynamic>)),
      onError: (error) {
        if (!_isManuallyUnsubscribed) {  // Csak akkor hívódjon meg, ha nem manuális leiratkozás történt
          onError();
        }
      }
  );
}

void unsubscribeFromAllAlerts() {
  try {
    _isManuallyUnsubscribed = true;  // Beállítjuk a flag-et, hogy manuális leiratkozás történt
    SSEClient.unsubscribeFromSSE();  // Kapcsolat bontása
  } catch (_) {
    Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekről való leiratkozáskor.');
  }
}
