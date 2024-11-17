// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_header.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosHeaderDto _$SosHeaderDtoFromJson(Map<String, dynamic> json) {
  return _SosHeaderDto.fromJson(json);
}

/// @nodoc
mixin _$SosHeaderDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get boatId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosHeaderDtoCopyWith<SosHeaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosHeaderDtoCopyWith<$Res> {
  factory $SosHeaderDtoCopyWith(
          SosHeaderDto value, $Res Function(SosHeaderDto) then) =
      _$SosHeaderDtoCopyWithImpl<$Res, SosHeaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      double longitude,
      double latitude,
      String date,
      String userId,
      String boatId,
      String phoneNumber});
}

/// @nodoc
class _$SosHeaderDtoCopyWithImpl<$Res, $Val extends SosHeaderDto>
    implements $SosHeaderDtoCopyWith<$Res> {
  _$SosHeaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? userId = null,
    Object? boatId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatId: null == boatId
          ? _value.boatId
          : boatId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SosHeaderDtoImplCopyWith<$Res>
    implements $SosHeaderDtoCopyWith<$Res> {
  factory _$$SosHeaderDtoImplCopyWith(
          _$SosHeaderDtoImpl value, $Res Function(_$SosHeaderDtoImpl) then) =
      __$$SosHeaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      double longitude,
      double latitude,
      String date,
      String userId,
      String boatId,
      String phoneNumber});
}

/// @nodoc
class __$$SosHeaderDtoImplCopyWithImpl<$Res>
    extends _$SosHeaderDtoCopyWithImpl<$Res, _$SosHeaderDtoImpl>
    implements _$$SosHeaderDtoImplCopyWith<$Res> {
  __$$SosHeaderDtoImplCopyWithImpl(
      _$SosHeaderDtoImpl _value, $Res Function(_$SosHeaderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? userId = null,
    Object? boatId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$SosHeaderDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boatId: null == boatId
          ? _value.boatId
          : boatId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SosHeaderDtoImpl extends _SosHeaderDto {
  const _$SosHeaderDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.longitude,
      required this.latitude,
      required this.date,
      required this.userId,
      required this.boatId,
      required this.phoneNumber})
      : super._();

  factory _$SosHeaderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosHeaderDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String date;
  @override
  final String userId;
  @override
  final String boatId;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SosHeaderDto(id: $id, longitude: $longitude, latitude: $latitude, date: $date, userId: $userId, boatId: $boatId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosHeaderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boatId, boatId) || other.boatId == boatId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, longitude, latitude, date, userId, boatId, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SosHeaderDtoImplCopyWith<_$SosHeaderDtoImpl> get copyWith =>
      __$$SosHeaderDtoImplCopyWithImpl<_$SosHeaderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosHeaderDtoImplToJson(
      this,
    );
  }
}

abstract class _SosHeaderDto extends SosHeaderDto {
  const factory _SosHeaderDto(
      {@JsonKey(name: "_id") required final String? id,
      required final double longitude,
      required final double latitude,
      required final String date,
      required final String userId,
      required final String boatId,
      required final String phoneNumber}) = _$SosHeaderDtoImpl;
  const _SosHeaderDto._() : super._();

  factory _SosHeaderDto.fromJson(Map<String, dynamic> json) =
      _$SosHeaderDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get date;
  @override
  String get userId;
  @override
  String get boatId;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$SosHeaderDtoImplCopyWith<_$SosHeaderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
