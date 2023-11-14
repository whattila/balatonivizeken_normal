import 'dart:async';

import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/providers/center_point/center_point.provider.dart';
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
    final centerPoint = ref.read(centerPointProvider);
    final markerData = await api.getMarkers(centerPoint: LocationDto(longitude: centerPoint.longitude, latitude: centerPoint.latitude));

    return markerData;
  }

  Future<void> refreshMarkers() async {
    timer?.cancel();
    final boat = ref.read(boatProvider).value;
    final boatType = boat?.boatType;
    timer = Timer.periodic(
      Duration(seconds: boatType?.refreshRate ?? 15),
      (timer) async {
        print('MARKER UPDATE STARTED');
        final centerPoint = ref.read(centerPointProvider);

        final markerData = await api.getMarkers(centerPoint: LocationDto(longitude: centerPoint.longitude, latitude: centerPoint.latitude));

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
