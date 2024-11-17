// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_header.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SosHeaderDtoImpl _$$SosHeaderDtoImplFromJson(Map<String, dynamic> json) =>
    _$SosHeaderDtoImpl(
      id: json['_id'] as String?,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      date: json['date'] as String,
      userId: json['userId'] as String,
      boatId: json['boatId'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$SosHeaderDtoImplToJson(_$SosHeaderDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date': instance.date,
      'userId': instance.userId,
      'boatId': instance.boatId,
      'phoneNumber': instance.phoneNumber,
    };
