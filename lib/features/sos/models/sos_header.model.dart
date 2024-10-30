import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_header.model.freezed.dart';
part 'sos_header.model.g.dart';

@freezed
class SosHeaderDto with _$SosHeaderDto {
  // For the custom properties to work
  const SosHeaderDto._();
  const factory SosHeaderDto({
    @JsonKey(name: "_id") required String? id,
    required double longitude,
    required double latitude,
    required String date,
    required String userId,
    required String boatId,
    required String phoneNumber
  }) = _SosHeaderDto;

  int get timePassed => DateTime.now().difference(DateTime.parse(date)).inMinutes;

  factory SosHeaderDto.fromJson(Map<String, Object?> json)
  => _$SosHeaderDtoFromJson(json);
}