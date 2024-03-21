// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkerDtoImpl _$$MarkerDtoImplFromJson(Map<String, dynamic> json) =>
    _$MarkerDtoImpl(
      id: json['_id'] as String?,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$MarkerDtoImplToJson(_$MarkerDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
