// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.g.dart';
part 'user.model.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int? id,
    required String accessToken,
    required double expiresIn,
    required String tokenType,
    required String refreshToken,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
