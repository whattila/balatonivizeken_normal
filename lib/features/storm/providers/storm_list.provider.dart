import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../api/backend/client/client.dart';
import '../../../api/backend/providers/client_provider/client_provider.dart';
import '../../../core/dio_error_handler.dart';
import '../../map/model/location/location.model.dart';
import '../../snack/snack.dart';
import '../models/storm.model.dart';

part 'storm_list.provider.g.dart';

@Riverpod(keepAlive: true)
class StormList extends _$StormList {
  @override
  Future<List<StormDto>> build() async {
    final location = ref.read(locationProvider);
    return await api.getStorms(centerPoint: LocationDto(longitude: location.longitude, latitude: location.latitude));
  }

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> refreshStorms() async {
    final location = ref.read(locationProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => api.getStorms(centerPoint: LocationDto(longitude: location.longitude, latitude: location.latitude)));
  }
}