// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storm.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StormDto _$StormDtoFromJson(Map<String, dynamic> json) {
  return _StormDto.fromJson(json);
}

/// @nodoc
mixin _$StormDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  StormDegree get degree => throw _privateConstructorUsedError;
  int get windSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StormDtoCopyWith<StormDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StormDtoCopyWith<$Res> {
  factory $StormDtoCopyWith(StormDto value, $Res Function(StormDto) then) =
      _$StormDtoCopyWithImpl<$Res, StormDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String area,
      double longitude,
      double latitude,
      int hour,
      int minute,
      StormDegree degree,
      int windSpeed});
}

/// @nodoc
class _$StormDtoCopyWithImpl<$Res, $Val extends StormDto>
    implements $StormDtoCopyWith<$Res> {
  _$StormDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? area = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? hour = null,
    Object? minute = null,
    Object? degree = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as StormDegree,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StormDtoImplCopyWith<$Res>
    implements $StormDtoCopyWith<$Res> {
  factory _$$StormDtoImplCopyWith(
          _$StormDtoImpl value, $Res Function(_$StormDtoImpl) then) =
      __$$StormDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String area,
      double longitude,
      double latitude,
      int hour,
      int minute,
      StormDegree degree,
      int windSpeed});
}

/// @nodoc
class __$$StormDtoImplCopyWithImpl<$Res>
    extends _$StormDtoCopyWithImpl<$Res, _$StormDtoImpl>
    implements _$$StormDtoImplCopyWith<$Res> {
  __$$StormDtoImplCopyWithImpl(
      _$StormDtoImpl _value, $Res Function(_$StormDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? area = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? hour = null,
    Object? minute = null,
    Object? degree = null,
    Object? windSpeed = null,
  }) {
    return _then(_$StormDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as StormDegree,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StormDtoImpl extends _StormDto {
  const _$StormDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.area,
      required this.longitude,
      required this.latitude,
      required this.hour,
      required this.minute,
      required this.degree,
      required this.windSpeed})
      : super._();

  factory _$StormDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StormDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String area;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final int hour;
  @override
  final int minute;
  @override
  final StormDegree degree;
  @override
  final int windSpeed;

  @override
  String toString() {
    return 'StormDto(id: $id, area: $area, longitude: $longitude, latitude: $latitude, hour: $hour, minute: $minute, degree: $degree, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StormDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, area, longitude, latitude,
      hour, minute, degree, windSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StormDtoImplCopyWith<_$StormDtoImpl> get copyWith =>
      __$$StormDtoImplCopyWithImpl<_$StormDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StormDtoImplToJson(
      this,
    );
  }
}

abstract class _StormDto extends StormDto {
  const factory _StormDto(
      {@JsonKey(name: "_id") required final String? id,
      required final String area,
      required final double longitude,
      required final double latitude,
      required final int hour,
      required final int minute,
      required final StormDegree degree,
      required final int windSpeed}) = _$StormDtoImpl;
  const _StormDto._() : super._();

  factory _StormDto.fromJson(Map<String, dynamic> json) =
      _$StormDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String get area;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  int get hour;
  @override
  int get minute;
  @override
  StormDegree get degree;
  @override
  int get windSpeed;
  @override
  @JsonKey(ignore: true)
  _$$StormDtoImplCopyWith<_$StormDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
