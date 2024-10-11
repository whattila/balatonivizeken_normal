import 'dart:convert';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storm/models/process_storm_alert.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import '../../features/sos/models/process_sos_alert.dart';
import '../../features/sos/models/sos_alert.model.dart';
import '../../features/storm/models/storm.model.dart';

void subscribeToNotifications() {
  SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://10.0.2.2:3000/storm/alerts',
      header: {} // TODO: itt lehetne valami authorization header... vagy lehet kell is? Vagy lehet ezt megoldja a megfelelő interceptor?
  ).listen(
        (event) => processStormAlert(StormDto.fromJson(jsonDecode(event.data ?? '') as Map<String, dynamic>)),
        onError: (error) => Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekre való feliratkozáskor.')
    // TODO: ne jelenjen ez meg mikor kilépünk!
  );
  SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://10.0.2.2:3000/sos/alerts',
      header: {} // TODO: itt lehetne valami authorization header... vagy lehet kell is? Vagy lehet ezt megoldja a megfelelő interceptor?
  ).listen(
        (event) => processSosAlert(SosAlertDto.fromJson(jsonDecode(event.data ?? '') as Map<String, dynamic>)),
        onError: (error) => Snack.showWithoutContext(text: 'Hiba a segélyjelzés értesítésekre való feliratkozáskor.')
      // TODO: ne jelenjen ez meg mikor kilépünk!
  );
}

void unsubscribeFromSSE() {
  try {
    SSEClient.unsubscribeFromSSE();
  } catch (_) {
    Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekről való leiratkozáskor.');
  }
}