import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'no_go_zone.model.freezed.dart';
part 'no_go_zone.model.g.dart';

@freezed
class NoGoZone with _$NoGoZone {
  const factory NoGoZone({
    @JsonKey(name: "_id") required String? id,
    required List<LocationDto> zonePoints,
  }) = _NoGoZone;

  factory NoGoZone.fromJson(Map<String, dynamic> json) => _$NoGoZoneFromJson(json);
}
