// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_alert.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosAlertDto _$SosAlertDtoFromJson(Map<String, dynamic> json) {
  return _SosAlertDto.fromJson(json);
}

/// @nodoc
mixin _$SosAlertDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get boatId => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<LocationDto> get lastPositions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosAlertDtoCopyWith<SosAlertDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosAlertDtoCopyWith<$Res> {
  factory $SosAlertDtoCopyWith(
          SosAlertDto value, $Res Function(SosAlertDto) then) =
      _$SosAlertDtoCopyWithImpl<$Res, SosAlertDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String userId,
      String boatId,
      double longitude,
      double latitude,
      String date,
      String phoneNumber,
      List<LocationDto> lastPositions});
}

/// @nodoc
class _$SosAlertDtoCopyWithImpl<$Res, $Val extends SosAlertDto>
    implements $SosAlertDtoCopyWith<$Res> {
  _$SosAlertDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? boatId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? phoneNumber = null,
    Object? lastPositions = null,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastPositions: null == lastPositions
          ? _value.lastPositions
          : lastPositions // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SosAlertDtoImplCopyWith<$Res>
    implements $SosAlertDtoCopyWith<$Res> {
  factory _$$SosAlertDtoImplCopyWith(
          _$SosAlertDtoImpl value, $Res Function(_$SosAlertDtoImpl) then) =
      __$$SosAlertDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String userId,
      String boatId,
      double longitude,
      double latitude,
      String date,
      String phoneNumber,
      List<LocationDto> lastPositions});
}

/// @nodoc
class __$$SosAlertDtoImplCopyWithImpl<$Res>
    extends _$SosAlertDtoCopyWithImpl<$Res, _$SosAlertDtoImpl>
    implements _$$SosAlertDtoImplCopyWith<$Res> {
  __$$SosAlertDtoImplCopyWithImpl(
      _$SosAlertDtoImpl _value, $Res Function(_$SosAlertDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? boatId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? phoneNumber = null,
    Object? lastPositions = null,
  }) {
    return _then(_$SosAlertDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastPositions: null == lastPositions
          ? _value._lastPositions
          : lastPositions // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SosAlertDtoImpl extends _SosAlertDto {
  const _$SosAlertDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.userId,
      required this.boatId,
      required this.longitude,
      required this.latitude,
      required this.date,
      required this.phoneNumber,
      required final List<LocationDto> lastPositions})
      : _lastPositions = lastPositions,
        super._();

  factory _$SosAlertDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosAlertDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
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
  final String phoneNumber;
  final List<LocationDto> _lastPositions;
  @override
  List<LocationDto> get lastPositions {
    if (_lastPositions is EqualUnmodifiableListView) return _lastPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastPositions);
  }

  @override
  String toString() {
    return 'SosAlertDto(id: $id, userId: $userId, boatId: $boatId, longitude: $longitude, latitude: $latitude, date: $date, phoneNumber: $phoneNumber, lastPositions: $lastPositions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosAlertDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boatId, boatId) || other.boatId == boatId) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other._lastPositions, _lastPositions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      boatId,
      longitude,
      latitude,
      date,
      phoneNumber,
      const DeepCollectionEquality().hash(_lastPositions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SosAlertDtoImplCopyWith<_$SosAlertDtoImpl> get copyWith =>
      __$$SosAlertDtoImplCopyWithImpl<_$SosAlertDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosAlertDtoImplToJson(
      this,
    );
  }
}

abstract class _SosAlertDto extends SosAlertDto {
  const factory _SosAlertDto(
      {@JsonKey(name: "_id") required final String? id,
      required final String userId,
      required final String boatId,
      required final double longitude,
      required final double latitude,
      required final String date,
      required final String phoneNumber,
      required final List<LocationDto> lastPositions}) = _$SosAlertDtoImpl;
  const _SosAlertDto._() : super._();

  factory _SosAlertDto.fromJson(Map<String, dynamic> json) =
      _$SosAlertDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
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
  String get phoneNumber;
  @override
  List<LocationDto> get lastPositions;
  @override
  @JsonKey(ignore: true)
  _$$SosAlertDtoImplCopyWith<_$SosAlertDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
