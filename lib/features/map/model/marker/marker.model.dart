import 'package:balatonivizeken/features/map/model/marker/marker_type.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'marker.model.g.dart';
part 'marker.model.freezed.dart';

@freezed
class MarkerDto with _$MarkerDto {
  const factory MarkerDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") required String? boatId, // between MarkerDto-s with type of MarkerType.boat, boatId is unique. Otherwise, it is not!
    required double longitude,
    required double latitude,
    @Default(MarkerType.boat) MarkerType type
  }) = _MarkerDto;

  factory MarkerDto.fromJson(Map<String, dynamic> json) => _$MarkerDtoFromJson(json);
}
