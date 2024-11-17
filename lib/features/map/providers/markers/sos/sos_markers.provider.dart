import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/model/marker/marker_type.enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/location/location.model.dart';

part 'sos_markers.provider.g.dart';

// TODO test: bekerül-e a state-be annyi MarkerDto a paraméterként kapott id-val és koordinátákkal, ahány hosszú a lastPositions? nem marad paraméterként kapott id-jú MarkerDto a state-ben?
@Riverpod(keepAlive: true)
class SosMarkers extends _$SosMarkers {
  @override
  List<MarkerDto> build() => <MarkerDto>[];

  void addSos(String id, List<LocationDto> lastPositions) {
    final markers = lastPositions.map(
          (position) => MarkerDto(
            id: id,
            longitude: position.longitude,
            latitude: position.latitude,
            type: identical(lastPositions.last, position) ? MarkerType.sosLastPosition : MarkerType.sosPosition,
          ),
    ).toList(); // convert to List to avoid lazy evaluation issues

    state = [...state, ...markers]; // this explicitly sets a new state
  }


  void removeSos(String id) {
    state = state.where((marker) => marker.id != id).toList(); // new state with removed items
  }
}