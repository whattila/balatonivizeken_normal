// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_input.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosInputDto _$SosInputDtoFromJson(Map<String, dynamic> json) {
  return _SosInputDto.fromJson(json);
}

/// @nodoc
mixin _$SosInputDto {
  String get userId => throw _privateConstructorUsedError;
  String get boatId => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosInputDtoCopyWith<SosInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosInputDtoCopyWith<$Res> {
  factory $SosInputDtoCopyWith(
          SosInputDto value, $Res Function(SosInputDto) then) =
      _$SosInputDtoCopyWithImpl<$Res, SosInputDto>;
  @useResult
  $Res call(
      {String userId,
      String boatId,
      double longitude,
      double latitude,
      String date});
}

/// @nodoc
class _$SosInputDtoCopyWithImpl<$Res, $Val extends SosInputDto>
    implements $SosInputDtoCopyWith<$Res> {
  _$SosInputDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? boatId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatId: null == boatId
          ? _value.boatId
          : boatId // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SosInputDtoImplCopyWith<$Res>
    implements $SosInputDtoCopyWith<$Res> {
  factory _$$SosInputDtoImplCopyWith(
          _$SosInputDtoImpl value, $Res Function(_$SosInputDtoImpl) then) =
      __$$SosInputDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String boatId,
      double longitude,
      double latitude,
      String date});
}

/// @nodoc
class __$$SosInputDtoImplCopyWithImpl<$Res>
    extends _$SosInputDtoCopyWithImpl<$Res, _$SosInputDtoImpl>
    implements _$$SosInputDtoImplCopyWith<$Res> {
  __$$SosInputDtoImplCopyWithImpl(
      _$SosInputDtoImpl _value, $Res Function(_$SosInputDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? boatId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
  }) {
    return _then(_$SosInputDtoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatId: null == boatId
          ? _value.boatId
          : boatId // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SosInputDtoImpl implements _SosInputDto {
  const _$SosInputDtoImpl(
      {required this.userId,
      required this.boatId,
      required this.longitude,
      required this.latitude,
      required this.date});

  factory _$SosInputDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosInputDtoImplFromJson(json);

  @override
  final String userId;
  @override
  final String boatId;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String date;

  @override
  String toString() {
    return 'SosInputDto(userId: $userId, boatId: $boatId, longitude: $longitude, latitude: $latitude, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosInputDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boatId, boatId) || other.boatId == boatId) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, boatId, longitude, latitude, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SosInputDtoImplCopyWith<_$SosInputDtoImpl> get copyWith =>
      __$$SosInputDtoImplCopyWithImpl<_$SosInputDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosInputDtoImplToJson(
      this,
    );
  }
}

abstract class _SosInputDto implements SosInputDto {
  const factory _SosInputDto(
      {required final String userId,
      required final String boatId,
      required final double longitude,
      required final double latitude,
      required final String date}) = _$SosInputDtoImpl;

  factory _SosInputDto.fromJson(Map<String, dynamic> json) =
      _$SosInputDtoImpl.fromJson;

  @override
  String get userId;
  @override
  String get boatId;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$SosInputDtoImplCopyWith<_$SosInputDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
