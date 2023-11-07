import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat_type.provider.g.dart';

@Riverpod(keepAlive: true)
class BoatTypeProvider extends _$BoatTypeProvider {
  @override
  BoatType build() {
    return BoatType.smallBoat;
  }

  void setBoatType(BoatType boatType) {
    state = boatType;
  }
}
