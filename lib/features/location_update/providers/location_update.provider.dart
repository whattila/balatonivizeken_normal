import 'dart:async';

import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:balatonivizeken/features/map/providers/geolocation/geolocation.provider.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_update.provider.g.dart';

@Riverpod(keepAlive: true)
class LocationUpdate extends _$LocationUpdate {
  Timer? timer;

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );

  @override
  Future<void> build() async {
    startLocationUpdate();
  }

  Future<void> startLocationUpdate() async {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        print('LOCATION UPDATE STARTED');
        final gpsEnabled = ref.read(gpsEnabledProvider);
        final boatId = ref.read(boatProvider).value?.id;
        if (gpsEnabled == true && boatId != null) {
          print('CHECKING LOCATION');
          final Position location = await determinePosition();

          print('SUCCESFULLY GOT LOCATION: $location');
          ref.read(locationProvider.notifier).setPosition(location);

          await api.updateLocation(id: boatId, location: LocationDto(latitude: location.latitude, longitude: location.longitude));
          print('UPDATED LOCATION');
        }
      },
    );
  }

  void cancelTimer() => timer?.cancel();
}
