import 'dart:async';

import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat.provider.g.dart';

@riverpod
Future<BoatDto> boatById(
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
Future<BoatDto> boatByUserId(
  BoatByUserIdRef ref, {
  required String id,
}) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final boatData = await balatoniVizekenClient.getBoatByUserId(id: id);

  return boatData;
}
