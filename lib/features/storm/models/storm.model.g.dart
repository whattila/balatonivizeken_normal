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
      date: json['date'] as String,
      degree: $enumDecode(_$StormDegreeEnumMap, json['degree']),
      windSpeed: json['windSpeed'] as int,
    );

Map<String, dynamic> _$$StormDtoImplToJson(_$StormDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'area': instance.area,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date': instance.date,
      'degree': _$StormDegreeEnumMap[instance.degree]!,
      'windSpeed': instance.windSpeed,
    };

const _$StormDegreeEnumMap = {
  StormDegree.basic: 'basic',
  StormDegree.first: 'first',
  StormDegree.second: 'second',
};
