import 'package:balatonivizeken/features/storm/models/process_storm_alert.dart';
import 'package:balatonivizeken/features/storm/providers/storm_list.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/backend/sse.dart';
import '../snack/snack.dart';
import '../storage/user_storage/user_storage_provider/user_storage.provider.dart';

// TODO test: erre még térjünk vissza
class AlertsService {
  AlertsService(this.ref);
  final Ref ref;

  Future<void> subscribeToAlerts() async {
    final accessToken = await ref.read(userStorageProvider).getToken();
    subscribeToStormAlerts(
      accessToken!,
      onEvent: (stormAlert) {
        processStormAlert(stormAlert, ref);
        ref.read(stormListProvider.notifier).refreshStorms();
      },
      onError: () => Snack.showWithoutContext(text: 'Hiba a viharjelzés értesítésekre való feliratkozáskor.'),
    );
  }

  void unsubscribeFromAlerts() {
    unsubscribeFromAllAlerts();
  }
}