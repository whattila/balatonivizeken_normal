import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'center_point.provider.g.dart';

@Riverpod(keepAlive: true)
class CenterPoint extends _$CenterPoint {
  @override
  LatLng build() {
    return LatLng(46.78, 17.77);
  }

  void setCenterPoint(LatLng centerPoint) {
    state = centerPoint;
  }
}
