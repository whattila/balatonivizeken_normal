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
      type: $enumDecodeNullable(_$MarkerTypeEnumMap, json['type']) ??
          MarkerType.boat,
    );

Map<String, dynamic> _$$MarkerDtoImplToJson(_$MarkerDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'type': _$MarkerTypeEnumMap[instance.type]!,
    };

const _$MarkerTypeEnumMap = {
  MarkerType.boat: 'boat',
  MarkerType.sosPosition: 'sosPosition',
  MarkerType.sosLastPosition: 'sosLastPosition',
};
