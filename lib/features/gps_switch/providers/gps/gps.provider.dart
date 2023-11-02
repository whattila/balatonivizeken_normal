import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/gps_switch/models/gps_enabled.model.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gps.provider.g.dart';

@Riverpod(keepAlive: true)
class GpsEnabled extends _$GpsEnabled {
  @override
  bool build() {
    return false;
  }

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );

  void setGpsEnabled(String? boatId, {required bool enabled}) {
    state = enabled;

    if (boatId != null) {
      api.updateGpsEnabled(id: boatId, gpsEnabled: GpsEnabledDto(gpsEnabled: enabled));
    }
  }
}
