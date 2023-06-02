// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boat.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoatDto _$BoatDtoFromJson(Map<String, dynamic> json) {
  return _BoatDto.fromJson(json);
}

/// @nodoc
mixin _$BoatDto {
// ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  BoatType get boatType => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  bool get gpsEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoatDtoCopyWith<BoatDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoatDtoCopyWith<$Res> {
  factory $BoatDtoCopyWith(BoatDto value, $Res Function(BoatDto) then) =
      _$BoatDtoCopyWithImpl<$Res, BoatDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String userId,
      BoatType boatType,
      String displayName,
      double longitude,
      double latitude,
      bool gpsEnabled});
}

/// @nodoc
class _$BoatDtoCopyWithImpl<$Res, $Val extends BoatDto>
    implements $BoatDtoCopyWith<$Res> {
  _$BoatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? boatType = null,
    Object? displayName = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? gpsEnabled = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatType: null == boatType
          ? _value.boatType
          : boatType // ignore: cast_nullable_to_non_nullable
              as BoatType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      gpsEnabled: null == gpsEnabled
          ? _value.gpsEnabled
          : gpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoatDtoCopyWith<$Res> implements $BoatDtoCopyWith<$Res> {
  factory _$$_BoatDtoCopyWith(
          _$_BoatDto value, $Res Function(_$_BoatDto) then) =
      __$$_BoatDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String userId,
      BoatType boatType,
      String displayName,
      double longitude,
      double latitude,
      bool gpsEnabled});
}

/// @nodoc
class __$$_BoatDtoCopyWithImpl<$Res>
    extends _$BoatDtoCopyWithImpl<$Res, _$_BoatDto>
    implements _$$_BoatDtoCopyWith<$Res> {
  __$$_BoatDtoCopyWithImpl(_$_BoatDto _value, $Res Function(_$_BoatDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? boatType = null,
    Object? displayName = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? gpsEnabled = null,
  }) {
    return _then(_$_BoatDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatType: null == boatType
          ? _value.boatType
          : boatType // ignore: cast_nullable_to_non_nullable
              as BoatType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      gpsEnabled: null == gpsEnabled
          ? _value.gpsEnabled
          : gpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoatDto implements _BoatDto {
  const _$_BoatDto(
      {@JsonKey(name: "_id") required this.id,
      required this.userId,
      required this.boatType,
      required this.displayName,
      required this.longitude,
      required this.latitude,
      required this.gpsEnabled});

  factory _$_BoatDto.fromJson(Map<String, dynamic> json) =>
      _$$_BoatDtoFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String userId;
  @override
  final BoatType boatType;
  @override
  final String displayName;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final bool gpsEnabled;

  @override
  String toString() {
    return 'BoatDto(id: $id, userId: $userId, boatType: $boatType, displayName: $displayName, longitude: $longitude, latitude: $latitude, gpsEnabled: $gpsEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoatDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boatType, boatType) ||
                other.boatType == boatType) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.gpsEnabled, gpsEnabled) ||
                other.gpsEnabled == gpsEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, boatType,
      displayName, longitude, latitude, gpsEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoatDtoCopyWith<_$_BoatDto> get copyWith =>
      __$$_BoatDtoCopyWithImpl<_$_BoatDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoatDtoToJson(
      this,
    );
  }
}

abstract class _BoatDto implements BoatDto {
  const factory _BoatDto(
      {@JsonKey(name: "_id") required final String? id,
      required final String userId,
      required final BoatType boatType,
      required final String displayName,
      required final double longitude,
      required final double latitude,
      required final bool gpsEnabled}) = _$_BoatDto;

  factory _BoatDto.fromJson(Map<String, dynamic> json) = _$_BoatDto.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id;
  @override
  String get userId;
  @override
  BoatType get boatType;
  @override
  String get displayName;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  bool get gpsEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_BoatDtoCopyWith<_$_BoatDto> get copyWith =>
      throw _privateConstructorUsedError;
}
