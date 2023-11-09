// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'no_go_zone.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoGoZone _$NoGoZoneFromJson(Map<String, dynamic> json) {
  return _NoGoZone.fromJson(json);
}

/// @nodoc
mixin _$NoGoZone {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  List<LocationDto> get zonePoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoGoZoneCopyWith<NoGoZone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoGoZoneCopyWith<$Res> {
  factory $NoGoZoneCopyWith(NoGoZone value, $Res Function(NoGoZone) then) =
      _$NoGoZoneCopyWithImpl<$Res, NoGoZone>;
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, List<LocationDto> zonePoints});
}

/// @nodoc
class _$NoGoZoneCopyWithImpl<$Res, $Val extends NoGoZone>
    implements $NoGoZoneCopyWith<$Res> {
  _$NoGoZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zonePoints = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zonePoints: null == zonePoints
          ? _value.zonePoints
          : zonePoints // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoGoZoneCopyWith<$Res> implements $NoGoZoneCopyWith<$Res> {
  factory _$$_NoGoZoneCopyWith(
          _$_NoGoZone value, $Res Function(_$_NoGoZone) then) =
      __$$_NoGoZoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, List<LocationDto> zonePoints});
}

/// @nodoc
class __$$_NoGoZoneCopyWithImpl<$Res>
    extends _$NoGoZoneCopyWithImpl<$Res, _$_NoGoZone>
    implements _$$_NoGoZoneCopyWith<$Res> {
  __$$_NoGoZoneCopyWithImpl(
      _$_NoGoZone _value, $Res Function(_$_NoGoZone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zonePoints = null,
  }) {
    return _then(_$_NoGoZone(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zonePoints: null == zonePoints
          ? _value._zonePoints
          : zonePoints // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoGoZone implements _NoGoZone {
  const _$_NoGoZone(
      {@JsonKey(name: "_id") required this.id,
      required final List<LocationDto> zonePoints})
      : _zonePoints = zonePoints;

  factory _$_NoGoZone.fromJson(Map<String, dynamic> json) =>
      _$$_NoGoZoneFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  final List<LocationDto> _zonePoints;
  @override
  List<LocationDto> get zonePoints {
    if (_zonePoints is EqualUnmodifiableListView) return _zonePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zonePoints);
  }

  @override
  String toString() {
    return 'NoGoZone(id: $id, zonePoints: $zonePoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoGoZone &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._zonePoints, _zonePoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_zonePoints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoGoZoneCopyWith<_$_NoGoZone> get copyWith =>
      __$$_NoGoZoneCopyWithImpl<_$_NoGoZone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoGoZoneToJson(
      this,
    );
  }
}

abstract class _NoGoZone implements NoGoZone {
  const factory _NoGoZone(
      {@JsonKey(name: "_id") required final String? id,
      required final List<LocationDto> zonePoints}) = _$_NoGoZone;

  factory _NoGoZone.fromJson(Map<String, dynamic> json) = _$_NoGoZone.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  List<LocationDto> get zonePoints;
  @override
  @JsonKey(ignore: true)
  _$$_NoGoZoneCopyWith<_$_NoGoZone> get copyWith =>
      throw _privateConstructorUsedError;
}
