// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoatDto _$$_BoatDtoFromJson(Map<String, dynamic> json) => _$_BoatDto(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      boatType: $enumDecode(_$BoatTypeEnumMap, json['boatType']),
      displayName: json['displayName'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      gpsEnabled: json['gpsEnabled'] as bool,
    );

Map<String, dynamic> _$$_BoatDtoToJson(_$_BoatDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'boatType': _$BoatTypeEnumMap[instance.boatType]!,
      'displayName': instance.displayName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'gpsEnabled': instance.gpsEnabled,
    };

const _$BoatTypeEnumMap = {
  BoatType.sup: 'sup',
  BoatType.smallBoat: 'smallBoat',
  BoatType.licensedBoat: 'licensedBoat',
};
