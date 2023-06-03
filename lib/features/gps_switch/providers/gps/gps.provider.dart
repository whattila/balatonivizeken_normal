import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gps.provider.g.dart';

@riverpod
class GpsEnabled extends _$GpsEnabled {
  @override
  bool build() {
    return false;
  }
}
