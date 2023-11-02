import 'package:freezed_annotation/freezed_annotation.dart';

part 'marker.model.g.dart';
part 'marker.model.freezed.dart';

@freezed
class MarkerDto with _$MarkerDto {
  const factory MarkerDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") required String? id,
    required double longitude,
    required double latitude,
  }) = _MarkerDto;

  factory MarkerDto.fromJson(Map<String, dynamic> json) => _$MarkerDtoFromJson(json);
}
