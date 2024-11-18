import 'package:balatonivizeken/features/landing_screens/user_type.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.model.g.dart';
part 'registration.model.freezed.dart';

@freezed
class RegistrationDto with _$RegistrationDto {
  const factory RegistrationDto({
    required String username,
    required String emailAddress,
    required String password,
    required String familyName,
    required String givenName,
    required String phoneNumber,
    required UserType userType,
  }) = _RegistrationDto;

  factory RegistrationDto.fromJson(Map<String, dynamic> json) => _$RegistrationDtoFromJson(json);
}
