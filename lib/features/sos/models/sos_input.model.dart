import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_input.model.freezed.dart';
part 'sos_input.model.g.dart';

@freezed
class SosInputDto with _$SosInputDto {
  const factory SosInputDto({
    required String userId,
    required String boatId,
    required double longitude,
    required double latitude,
    required String date
  }) = _SosInputDto;

  factory SosInputDto.fromJson(Map<String, Object?> json)
  => _$SosInputDtoFromJson(json);
}