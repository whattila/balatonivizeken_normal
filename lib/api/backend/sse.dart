import 'dart:convert';

import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storm/models/process_storm_alert.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';

import '../../features/storm/models/storm.model.dart';

void subscribeToStormAlerts() {
  SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://10.0.2.2:3000/storm/alerts',
      header: {} // TODO: itt lehetne valami authorization header... vagy lehet kell is? Vagy lehet ezt megoldja a megfelelő interceptor?
  ).listen(
        (event) => processStormAlert(StormDto.fromJson(jsonDecode(event.data ?? '') as Map<String, dynamic>)),
        onError: (error) => Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekre való feliratkozáskor.')
  );
}

void unsubscribeFromSSE() {
  try {
    SSEClient.unsubscribeFromSSE();
  } catch (_) {
    Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekről való leiratkozáskor.');
  }
}