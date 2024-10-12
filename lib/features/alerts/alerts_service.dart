import 'package:balatonivizeken/features/sos/models/process_sos_alert.dart';
import 'package:balatonivizeken/features/storm/models/process_storm_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/backend/sse.dart';
import '../snack/snack.dart';
import '../storage/user_storage/user_storage_provider/user_storage.provider.dart';

class AlertsService {
  AlertsService(this.ref);
  final Ref ref;

  Future<void> subscribeToAlerts() async {
    final accessToken = await ref.read(userStorageProvider).getToken();
    subscribeToStormAlerts(
      accessToken!,
      onEvent: (stormAlert) => processStormAlert(stormAlert),
      onError: () => Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekre való feliratkozáskor.'),

    );
    subscribeToSosAlerts(
      accessToken,
      onEvent: (sosAlertDto) => processSosAlert(sosAlertDto),
      onError: ()  => Snack.showWithoutContext(text: 'Hiba a segélyjelzés értesítésekre való feliratkozáskor.'),
    );
  }

  void unsubscribeFromAlerts() {
    unsubscribeFromAllAlerts();
  }
}