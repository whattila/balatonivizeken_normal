import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/providers/markers/sos/sos_markers.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'boats/boat_markers.provider.dart';

part "markers.provider.g.dart";

@riverpod
Future<List<MarkerDto>> markers(MarkersRef ref) async {
  final boatMarkers = ref.watch(boatMarkersProvider);
  final sosMarkers = ref.watch(sosMarkersProvider);
  return boatMarkers.value! + sosMarkers;
}