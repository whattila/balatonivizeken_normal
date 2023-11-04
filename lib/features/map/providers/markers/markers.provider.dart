import 'dart:async';

import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'markers.provider.g.dart';

@riverpod
class Markers extends _$Markers {
  Timer? timer;

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );

  @override
  Future<List<MarkerDto>> build() async {
    final markerData = await api.getMarkers();

    return markerData;
  }

  Future<void> refreshMarkers() async {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        print('MARKER UPDATE STARTED');
        final markerData = await api.getMarkers();

        state = state.when(
          data: (data) {
            return AsyncValue.data(markerData);
          },
          error: AsyncValue.error,
          loading: AsyncValue.loading,
        );
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}
