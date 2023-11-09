import 'dart:async';

import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/map/model/no_go_zone/no_go_zone.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_go_zone.provider.g.dart';

@riverpod
Future<List<NoGoZone>> noGoZones(NoGoZonesRef ref) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final noGoZones = await balatoniVizekenClient.getZones();

  return noGoZones;
}
