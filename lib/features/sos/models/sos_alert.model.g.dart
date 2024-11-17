// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_alert.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SosAlertDtoImpl _$$SosAlertDtoImplFromJson(Map<String, dynamic> json) =>
    _$SosAlertDtoImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      boatId: json['boatId'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      date: json['date'] as String,
      phoneNumber: json['phoneNumber'] as String,
      lastPositions: (json['lastPositions'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SosAlertDtoImplToJson(_$SosAlertDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'boatId': instance.boatId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date': instance.date,
      'phoneNumber': instance.phoneNumber,
      'lastPositions': instance.lastPositions,
    };
