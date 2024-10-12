import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'alerts_service.dart';

part 'alerts_service.provider.g.dart';

@Riverpod(keepAlive: true)
AlertsService alertsService(AlertsServiceRef ref) {
  return AlertsService(ref);
}