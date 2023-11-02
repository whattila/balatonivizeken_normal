// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gps_enabled.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GpsEnabledDto _$GpsEnabledDtoFromJson(Map<String, dynamic> json) {
  return _GpsEnabledDto.fromJson(json);
}

/// @nodoc
mixin _$GpsEnabledDto {
  bool get gpsEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GpsEnabledDtoCopyWith<GpsEnabledDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpsEnabledDtoCopyWith<$Res> {
  factory $GpsEnabledDtoCopyWith(
          GpsEnabledDto value, $Res Function(GpsEnabledDto) then) =
      _$GpsEnabledDtoCopyWithImpl<$Res, GpsEnabledDto>;
  @useResult
  $Res call({bool gpsEnabled});
}

/// @nodoc
class _$GpsEnabledDtoCopyWithImpl<$Res, $Val extends GpsEnabledDto>
    implements $GpsEnabledDtoCopyWith<$Res> {
  _$GpsEnabledDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsEnabled = null,
  }) {
    return _then(_value.copyWith(
      gpsEnabled: null == gpsEnabled
          ? _value.gpsEnabled
          : gpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GpsEnabledDtoCopyWith<$Res>
    implements $GpsEnabledDtoCopyWith<$Res> {
  factory _$$_GpsEnabledDtoCopyWith(
          _$_GpsEnabledDto value, $Res Function(_$_GpsEnabledDto) then) =
      __$$_GpsEnabledDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool gpsEnabled});
}

/// @nodoc
class __$$_GpsEnabledDtoCopyWithImpl<$Res>
    extends _$GpsEnabledDtoCopyWithImpl<$Res, _$_GpsEnabledDto>
    implements _$$_GpsEnabledDtoCopyWith<$Res> {
  __$$_GpsEnabledDtoCopyWithImpl(
      _$_GpsEnabledDto _value, $Res Function(_$_GpsEnabledDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsEnabled = null,
  }) {
    return _then(_$_GpsEnabledDto(
      gpsEnabled: null == gpsEnabled
          ? _value.gpsEnabled
          : gpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GpsEnabledDto implements _GpsEnabledDto {
  const _$_GpsEnabledDto({required this.gpsEnabled});

  factory _$_GpsEnabledDto.fromJson(Map<String, dynamic> json) =>
      _$$_GpsEnabledDtoFromJson(json);

  @override
  final bool gpsEnabled;

  @override
  String toString() {
    return 'GpsEnabledDto(gpsEnabled: $gpsEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GpsEnabledDto &&
            (identical(other.gpsEnabled, gpsEnabled) ||
                other.gpsEnabled == gpsEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gpsEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GpsEnabledDtoCopyWith<_$_GpsEnabledDto> get copyWith =>
      __$$_GpsEnabledDtoCopyWithImpl<_$_GpsEnabledDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GpsEnabledDtoToJson(
      this,
    );
  }
}

abstract class _GpsEnabledDto implements GpsEnabledDto {
  const factory _GpsEnabledDto({required final bool gpsEnabled}) =
      _$_GpsEnabledDto;

  factory _GpsEnabledDto.fromJson(Map<String, dynamic> json) =
      _$_GpsEnabledDto.fromJson;

  @override
  bool get gpsEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_GpsEnabledDtoCopyWith<_$_GpsEnabledDto> get copyWith =>
      throw _privateConstructorUsedError;
}
