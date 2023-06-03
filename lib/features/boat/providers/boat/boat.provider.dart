import 'dart:async';

import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat.provider.g.dart';

@riverpod
Future<BoatDto?> boatById(
  BoatByIdRef ref, {
  required String id,
}) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final boatData = await balatoniVizekenClient.getBoatById(id: id);

  return boatData;
}

@riverpod
Future<BoatDto?> boatByUserId(
  BoatByUserIdRef ref,
) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final userStorage = ref.read(userStorageProvider);
  final user = (await userStorage.getUser())!;

  final boatData = await balatoniVizekenClient.getBoatByUserId(id: user.id!);

  ref.read(gpsEnabledProvider.notifier).state = boatData.gpsEnabled;
  ref.read(locationProvider.notifier).state = Position(latitude: boatData.latitude, longitude: boatData.longitude, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, timestamp: DateTime.now());

  return boatData;
}
