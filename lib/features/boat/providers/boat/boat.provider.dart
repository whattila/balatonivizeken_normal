import 'dart:async';

import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat.provider.g.dart';

@riverpod
class Boat extends _$Boat {
  @override
  Future<BoatDto?> build() async {
    final userStorage = ref.read(userStorageProvider);
    final user = (await userStorage.getUser())!;

    final boatData = await api.getBoatByUserId(id: user.id!);

//TODO valamiért nem állítja át a stateet
    if (boatData != null) {
      ref.read(gpsEnabledProvider.notifier).setGpsEnabled(boatData.gpsEnabled);
      ref.read(locationProvider.notifier).setPosition(Position(latitude: boatData.latitude, longitude: boatData.longitude, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, timestamp: DateTime.now()));
      state = AsyncData(boatData);
      return boatData;
    }
    return null;
  }

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            DioErrorHandler.handleErrorMessage(e);
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );
  Future<BoatDto?> boatById({
    required String id,
  }) async {
    final boatData = await api.getBoatById(id: id);

    state = AsyncData(boatData);
    return boatData;
  }

  Future<BoatDto?> updateBoat({
    required BoatType boatType,
    required String displayName,
  }) async {
    final boatId = state.value?.id;
    if (boatId != null) {
      final userStorage = ref.read(userStorageProvider);
      final user = (await userStorage.getUser())!;
      final gpsEnabled = ref.read(gpsEnabledProvider);
      final location = ref.read(locationProvider);
      final BoatDto boatDto = BoatDto(id: boatId, userId: user.id!, boatType: boatType, displayName: displayName, longitude: location.longitude, latitude: location.latitude, gpsEnabled: gpsEnabled);

      final boatData = await api.updateBoat(boatDto: boatDto);
      state = AsyncData(boatData);
      return boatData;
    }
    return null;
  }
}
