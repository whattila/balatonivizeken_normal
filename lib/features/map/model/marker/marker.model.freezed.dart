// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marker.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarkerDto _$MarkerDtoFromJson(Map<String, dynamic> json) {
  return _MarkerDto.fromJson(json);
}

/// @nodoc
mixin _$MarkerDto {
// ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id =>
      throw _privateConstructorUsedError; // between MarkerDto-s with type of MarkerType.boat, boatId is unique. Otherwise, it is not!
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  MarkerType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkerDtoCopyWith<MarkerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerDtoCopyWith<$Res> {
  factory $MarkerDtoCopyWith(MarkerDto value, $Res Function(MarkerDto) then) =
      _$MarkerDtoCopyWithImpl<$Res, MarkerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      double longitude,
      double latitude,
      MarkerType type});
}

/// @nodoc
class _$MarkerDtoCopyWithImpl<$Res, $Val extends MarkerDto>
    implements $MarkerDtoCopyWith<$Res> {
  _$MarkerDtoCopyWithImpl(this._value, this._then);

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
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarkerType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerDtoImplCopyWith<$Res>
    implements $MarkerDtoCopyWith<$Res> {
  factory _$$MarkerDtoImplCopyWith(
          _$MarkerDtoImpl value, $Res Function(_$MarkerDtoImpl) then) =
      __$$MarkerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      double longitude,
      double latitude,
      MarkerType type});
}

/// @nodoc
class __$$MarkerDtoImplCopyWithImpl<$Res>
    extends _$MarkerDtoCopyWithImpl<$Res, _$MarkerDtoImpl>
    implements _$$MarkerDtoImplCopyWith<$Res> {
  __$$MarkerDtoImplCopyWithImpl(
      _$MarkerDtoImpl _value, $Res Function(_$MarkerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = null,
    Object? latitude = null,
    Object? type = null,
  }) {
    return _then(_$MarkerDtoImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarkerType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkerDtoImpl implements _MarkerDto {
  const _$MarkerDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.longitude,
      required this.latitude,
      this.type = MarkerType.boat});

  factory _$MarkerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkerDtoImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "_id")
  final String? id;
// between MarkerDto-s with type of MarkerType.boat, boatId is unique. Otherwise, it is not!
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  @JsonKey()
  final MarkerType type;

  @override
  String toString() {
    return 'MarkerDto(id: $id, longitude: $longitude, latitude: $latitude, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, longitude, latitude, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerDtoImplCopyWith<_$MarkerDtoImpl> get copyWith =>
      __$$MarkerDtoImplCopyWithImpl<_$MarkerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkerDtoImplToJson(
      this,
    );
  }
}

abstract class _MarkerDto implements MarkerDto {
  const factory _MarkerDto(
      {@JsonKey(name: "_id") required final String? id,
      required final double longitude,
      required final double latitude,
      final MarkerType type}) = _$MarkerDtoImpl;

  factory _MarkerDto.fromJson(Map<String, dynamic> json) =
      _$MarkerDtoImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id;
  @override // between MarkerDto-s with type of MarkerType.boat, boatId is unique. Otherwise, it is not!
  double get longitude;
  @override
  double get latitude;
  @override
  MarkerType get type;
  @override
  @JsonKey(ignore: true)
  _$$MarkerDtoImplCopyWith<_$MarkerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
