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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarkerDto _$MarkerDtoFromJson(Map<String, dynamic> json) {
  return _MarkerDto.fromJson(json);
}

/// @nodoc
mixin _$MarkerDto {
// ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id, double longitude, double latitude});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarkerDtoCopyWith<$Res> implements $MarkerDtoCopyWith<$Res> {
  factory _$$_MarkerDtoCopyWith(
          _$_MarkerDto value, $Res Function(_$_MarkerDto) then) =
      __$$_MarkerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id, double longitude, double latitude});
}

/// @nodoc
class __$$_MarkerDtoCopyWithImpl<$Res>
    extends _$MarkerDtoCopyWithImpl<$Res, _$_MarkerDto>
    implements _$$_MarkerDtoCopyWith<$Res> {
  __$$_MarkerDtoCopyWithImpl(
      _$_MarkerDto _value, $Res Function(_$_MarkerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_$_MarkerDto(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarkerDto implements _MarkerDto {
  const _$_MarkerDto(
      {@JsonKey(name: "_id") required this.id,
      required this.longitude,
      required this.latitude});

  factory _$_MarkerDto.fromJson(Map<String, dynamic> json) =>
      _$$_MarkerDtoFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'MarkerDto(id: $id, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarkerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarkerDtoCopyWith<_$_MarkerDto> get copyWith =>
      __$$_MarkerDtoCopyWithImpl<_$_MarkerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarkerDtoToJson(
      this,
    );
  }
}

abstract class _MarkerDto implements MarkerDto {
  const factory _MarkerDto(
      {@JsonKey(name: "_id") required final String? id,
      required final double longitude,
      required final double latitude}) = _$_MarkerDto;

  factory _MarkerDto.fromJson(Map<String, dynamic> json) =
      _$_MarkerDto.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(ignore: true)
  _$$_MarkerDtoCopyWith<_$_MarkerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
