import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gps.provider.g.dart';

@Riverpod(keepAlive: true)
class GpsEnabled extends _$GpsEnabled {
  @override
  bool build() {
    return false;
  }

  void setGpsEnabled(bool enabled) {
    state = enabled;
  }
}
