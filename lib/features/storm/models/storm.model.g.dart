// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storm.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StormDtoImpl _$$StormDtoImplFromJson(Map<String, dynamic> json) =>
    _$StormDtoImpl(
      id: json['_id'] as String?,
      area: json['area'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      degree: $enumDecode(_$StormDegreeEnumMap, json['degree']),
      windSpeed: json['windSpeed'] as int,
    );

Map<String, dynamic> _$$StormDtoImplToJson(_$StormDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'area': instance.area,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'hour': instance.hour,
      'minute': instance.minute,
      'degree': _$StormDegreeEnumMap[instance.degree]!,
      'windSpeed': instance.windSpeed,
    };

const _$StormDegreeEnumMap = {
  StormDegree.basic: 'basic',
  StormDegree.first: 'first',
  StormDegree.second: 'second',
};
