import 'dart:async';
import 'dart:ui';

import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat_color/boat_color.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:balatonivizeken/features/toggle_buttons/providers/boat_type.provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat.provider.g.dart';

// TODO test: ha boatData null, a state is null-e? Ha egy nem null objektum, akkor az objektum-e? Ha user null, kivétel dobódik-e?
@Riverpod(keepAlive: true)
class Boat extends _$Boat {
  @override
  Future<BoatDto?> build() async {
    final userStorage = ref.read(userStorageProvider);
    final user = await userStorage.getUser();

    final boatData = await api.getBoatByUserId(id: user!.id!);

    if (boatData != null) {
      ref.read(gpsEnabledProvider.notifier).setGpsEnabled(null, enabled: boatData.gpsEnabled);
      ref.read(boatTypeProviderProvider.notifier).setBoatType(boatData.boatType);
      if (boatData.boatColor != null) {
        ref.read(boatColorProvider.notifier).setBoatcolor(Color(int.parse(boatData.boatColor!)));
      }
      ref.read(locationProvider.notifier).setPosition(Position(latitude: boatData.latitude, longitude: boatData.longitude, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, timestamp: DateTime.now(), altitudeAccuracy: 0, headingAccuracy: 0));
      state = AsyncData(boatData);
    }
    return boatData;
  }

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );

  Future<void> updateBoat({
    required String displayName,
  }) async {
    final boatId = state.value?.id;

    final userStorage = ref.read(userStorageProvider);
    final user = (await userStorage.getUser())!;
    final gpsEnabled = ref.read(gpsEnabledProvider);
    final boatType = ref.read(boatTypeProviderProvider);
    final location = ref.read(locationProvider);
    BoatDto boatDto;
    if (boatType != BoatType.waterSportsEquipment) {
      final boatColor = '0x${ref.read(boatColorProvider).value.toRadixString(16)}';
      boatDto = BoatDto(id: boatId, userId: user.id!, boatType: boatType, displayName: displayName, longitude: location.longitude, latitude: location.latitude, gpsEnabled: gpsEnabled, boatColor: boatColor);
    } else {
      boatDto = BoatDto(id: boatId, userId: user.id!, boatType: boatType, displayName: displayName, longitude: location.longitude, latitude: location.latitude, gpsEnabled: gpsEnabled);
    }

    final boatData = await api.updateBoat(boatDto: boatDto);
    Snack.showWithoutContext(text: "A hajó változtatásai sikeresen elmentve");

    state = AsyncData(boatData);
  }
}
