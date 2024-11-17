// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_input.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SosInputDtoImpl _$$SosInputDtoImplFromJson(Map<String, dynamic> json) =>
    _$SosInputDtoImpl(
      userId: json['userId'] as String,
      boatId: json['boatId'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$SosInputDtoImplToJson(_$SosInputDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'boatId': instance.boatId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date': instance.date,
    };
