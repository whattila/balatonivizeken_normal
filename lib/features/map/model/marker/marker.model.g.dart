// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarkerDto _$$_MarkerDtoFromJson(Map<String, dynamic> json) => _$_MarkerDto(
      id: json['_id'] as String?,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MarkerDtoToJson(_$_MarkerDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
