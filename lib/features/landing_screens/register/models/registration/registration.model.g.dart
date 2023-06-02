// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistrationDto _$$_RegistrationDtoFromJson(Map<String, dynamic> json) =>
    _$_RegistrationDto(
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      familyName: json['familyName'] as String,
      givenName: json['givenName'] as String,
    );

Map<String, dynamic> _$$_RegistrationDtoToJson(_$_RegistrationDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'familyName': instance.familyName,
      'givenName': instance.givenName,
    };
