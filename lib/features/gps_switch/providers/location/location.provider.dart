import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.provider.g.dart';

@riverpod
class Location extends _$Location {
  @override
  Position build() {
    return Position(longitude: 0.0, latitude: 0.0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
  }
}
