import 'package:freezed_annotation/freezed_annotation.dart';
import '../../map/model/location/location.model.dart';

part 'sos_alert.model.freezed.dart';
part 'sos_alert.model.g.dart';

@freezed
class SosAlertDto with _$SosAlertDto {
  // For the custom properties to work
  const SosAlertDto._();
  const factory SosAlertDto({
    @JsonKey(name: "_id") required String? id,
    required String userId,
    required String boatId,
    required double longitude,
    required double latitude,
    required String date,
    required String phoneNumber,
    required List<LocationDto> lastPositions
  }) = _SosAlertDto;

  int get timePassed => DateTime.now().difference(DateTime.parse(date)).inMinutes;
  String get displayDate => DateTime.parse(date).toString().substring(0, 16);

  factory SosAlertDto.fromJson(Map<String, Object?> json)
  => _$SosAlertDtoFromJson(json);
}