// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_go_zone.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoGoZone _$$_NoGoZoneFromJson(Map<String, dynamic> json) => _$_NoGoZone(
      id: json['_id'] as String?,
      zonePoints: (json['zonePoints'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NoGoZoneToJson(_$_NoGoZone instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'zonePoints': instance.zonePoints,
    };
