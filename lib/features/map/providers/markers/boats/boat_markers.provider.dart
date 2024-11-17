import 'dart:async';
import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat_markers.provider.g.dart';

// TODO test: a refreshMarkers futása után refreshRate időközönként hívódik-e a getMarkers?
@riverpod
class BoatMarkers extends _$BoatMarkers {
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
    final currentLocation = ref.read(locationProvider);
    final markerData = await api.getMarkers(centerPoint: LocationDto(longitude: currentLocation.longitude, latitude: currentLocation.latitude));
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
        final currentLocation = ref.read(locationProvider);
        state = const AsyncLoading();
        state = await AsyncValue.guard(() => api.getMarkers(centerPoint: LocationDto(longitude: currentLocation.longitude, latitude: currentLocation.latitude)));
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}
