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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$GpsEnabledDtoImplCopyWith<$Res>
    implements $GpsEnabledDtoCopyWith<$Res> {
  factory _$$GpsEnabledDtoImplCopyWith(
          _$GpsEnabledDtoImpl value, $Res Function(_$GpsEnabledDtoImpl) then) =
      __$$GpsEnabledDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool gpsEnabled});
}

/// @nodoc
class __$$GpsEnabledDtoImplCopyWithImpl<$Res>
    extends _$GpsEnabledDtoCopyWithImpl<$Res, _$GpsEnabledDtoImpl>
    implements _$$GpsEnabledDtoImplCopyWith<$Res> {
  __$$GpsEnabledDtoImplCopyWithImpl(
      _$GpsEnabledDtoImpl _value, $Res Function(_$GpsEnabledDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsEnabled = null,
  }) {
    return _then(_$GpsEnabledDtoImpl(
      gpsEnabled: null == gpsEnabled
          ? _value.gpsEnabled
          : gpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GpsEnabledDtoImpl implements _GpsEnabledDto {
  const _$GpsEnabledDtoImpl({required this.gpsEnabled});

  factory _$GpsEnabledDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GpsEnabledDtoImplFromJson(json);

  @override
  final bool gpsEnabled;

  @override
  String toString() {
    return 'GpsEnabledDto(gpsEnabled: $gpsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsEnabledDtoImpl &&
            (identical(other.gpsEnabled, gpsEnabled) ||
                other.gpsEnabled == gpsEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gpsEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsEnabledDtoImplCopyWith<_$GpsEnabledDtoImpl> get copyWith =>
      __$$GpsEnabledDtoImplCopyWithImpl<_$GpsEnabledDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GpsEnabledDtoImplToJson(
      this,
    );
  }
}

abstract class _GpsEnabledDto implements GpsEnabledDto {
  const factory _GpsEnabledDto({required final bool gpsEnabled}) =
      _$GpsEnabledDtoImpl;

  factory _GpsEnabledDto.fromJson(Map<String, dynamic> json) =
      _$GpsEnabledDtoImpl.fromJson;

  @override
  bool get gpsEnabled;
  @override
  @JsonKey(ignore: true)
  _$$GpsEnabledDtoImplCopyWith<_$GpsEnabledDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
