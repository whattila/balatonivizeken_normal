import 'package:freezed_annotation/freezed_annotation.dart';

part 'gps_enabled.model.g.dart';
part 'gps_enabled.model.freezed.dart';

@freezed
class GpsEnabledDto with _$GpsEnabledDto {
  const factory GpsEnabledDto({
    required bool gpsEnabled,
  }) = _GpsEnabledDto;

  factory GpsEnabledDto.fromJson(Map<String, dynamic> json) => _$GpsEnabledDtoFromJson(json);
}
