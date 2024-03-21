// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationDtoImpl _$$RegistrationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationDtoImpl(
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      familyName: json['familyName'] as String,
      givenName: json['givenName'] as String,
    );

Map<String, dynamic> _$$RegistrationDtoImplToJson(
        _$RegistrationDtoImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'familyName': instance.familyName,
      'givenName': instance.givenName,
    };
