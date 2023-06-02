import 'package:balatonivizeken/features/account/models/boat/boat_type.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boat.model.g.dart';
part 'boat.model.freezed.dart';

@freezed
class BoatDto with _$BoatDto {
  const factory BoatDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") required String? id,
    required String userId,
    required BoatType boatType,
    required String displayName,
    required double longitude,
    required double latitude,
    required bool gpsEnabled,
  }) = _BoatDto;

  factory BoatDto.fromJson(Map<String, dynamic> json) => _$BoatDtoFromJson(json);
}
