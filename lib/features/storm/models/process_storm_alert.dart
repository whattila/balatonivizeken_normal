import 'dart:math';
import 'package:balatonivizeken/features/map/providers/geolocation/geolocation.provider.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../gps_switch/providers/location/location.provider.dart';
import '../../notification/notification.dart';

const _earthRadiusKm = 6371;
const _stormRadiusKm = 10;

// Ha engedélyezte a felhasználó a helyzetéhez való hozzáférést
// Akkor megnézzük, hogy a vihar a közelében van-e, és csak akkor küldjük ki
// Ha nem engedélyezte, akkor kiküldjük, függetlenül a helyétől.
Future<void> processStormAlert(StormDto storm, Ref ref) async {
  Position? position;
  try {
    position = ref.read(locationProvider);
  } catch (_) {
    position = null;
  }

  if (position == null) {
    LocalNotifications.showStormNotification(stormDto: storm);
  }
  else {
    final distanceFromStorm = _calculateHaversineDistance(position, storm.latitude, storm.longitude);
    if (distanceFromStorm <= _stormRadiusKm) {
      LocalNotifications.showStormNotification(stormDto: storm);
    }
  }
}

double _calculateHaversineDistance(Position position, double stormLat, double stormLon) {
  final dLatRad = _degreesToRadians(position.latitude - stormLat);
  final dLonRad = _degreesToRadians(position.longitude - stormLon);
  final stormLatRad = _degreesToRadians(stormLat);
  final positionLatRad = _degreesToRadians(position.latitude);

  final a = pow(sin(dLatRad / 2), 2.toDouble()) + pow(sin(dLonRad / 2),
      2.toDouble()) * cos(stormLatRad) * cos(positionLatRad);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return _earthRadiusKm * c;
}

double _degreesToRadians(double degrees) {
  return degrees * pi / 180;
}
