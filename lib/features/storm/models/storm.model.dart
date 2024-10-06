import 'package:balatonivizeken/features/storm/models/storm_degree.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'storm.model.freezed.dart';
part 'storm.model.g.dart';

@freezed
class StormDto with _$StormDto {
  // For the custom properties to work
  const StormDto._();
  const factory StormDto({
    @JsonKey(name: "_id") required String? id,
    required String area,
    required double longitude,
    required double latitude,
    required int hour,
    required int minute,
    required StormDegree degree,
    required int windSpeed
  }) = _StormDto;

  factory StormDto.fromJson(Map<String, Object?> json)
  => _$StormDtoFromJson(json);

  String get instruction {
    switch (degree) {
      case StormDegree.basic:
        return 'Nyugodtan maradjon a vízben, de legyen óvatos!';
      case StormDegree.first:
        return 'Úszni, illetve csónakkal és más vízi sporteszközzel a vizen tartózkodni csak a parttól számított 500 méteren belül szabad!';
      case StormDegree.second:
        return 'Tilos fürödni és csónakkal és más vízi sporteszközzel közlekedni!';
    }
    return '';
  }

  String get windDefinition {
    if (windSpeed >= 2 && windSpeed <= 6) {
      return 'Gyenge szellő, fuvallat';
    } else if (windSpeed >= 7 && windSpeed <= 11) {
      return 'Enyhe szél';
    } else if (windSpeed >= 12 && windSpeed <= 19) {
      return 'Gyenge szél';
    } else if (windSpeed >= 20 && windSpeed <= 29) {
      return 'Mérsékelt szél';
    } else if (windSpeed >= 30 && windSpeed <= 39) {
      return 'Élénk szél';
    } else if (windSpeed >= 40 && windSpeed <= 49) {
      return 'Erős szél';
    } else if (windSpeed >= 50 && windSpeed <= 60) {
      return 'Viharos szél';
    } else if (windSpeed >= 61 && windSpeed <= 72) {
      return 'Élénk viharos szél, vihar';
    } else if (windSpeed >= 73 && windSpeed <= 85) {
      return 'Heves vihar';
    } else if (windSpeed >= 86 && windSpeed <= 100) {
      return 'Dühöngő vihar, szélvész';
    } else if (windSpeed >= 101 && windSpeed <= 115) {
      return 'Heves szélvész';
    } else if (windSpeed >= 116 && windSpeed <= 120) {
      return 'Orkán';
    } else {
      return 'Meghatározatlan sebességű szél';
    }
  }
}