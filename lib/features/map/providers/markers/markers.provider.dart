import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/providers/markers/sos/sos_markers.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'boats/boat_markers.provider.dart';

part "markers.provider.g.dart";

// TODO test: visszaad valamit a markers akkor is, ha a boatMarkersProvider változik, és akkor is, ha a sosMarkersProvider?
@riverpod
AsyncValue<List<MarkerDto>> markers(MarkersRef ref) {
  final boatMarkers = ref.watch(boatMarkersProvider);
  final sosMarkers = ref.watch(sosMarkersProvider);
  return boatMarkers.when(
    data: (boatMarkerList) => AsyncValue.data(boatMarkerList + sosMarkers),
    error: AsyncValue.error,
    loading: AsyncValue.loading,
  );
}