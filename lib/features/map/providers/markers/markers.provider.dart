import 'dart:async';

import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'markers.provider.g.dart';

@riverpod
Future<List<MarkerDto>> markers(
  MarkersRef ref,
) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final markerData = await balatoniVizekenClient.getMarkers();

  return markerData;
}
