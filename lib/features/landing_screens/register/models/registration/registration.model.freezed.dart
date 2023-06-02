// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) {
  return _RegistrationDto.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDto {
  String get username => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get familyName => throw _privateConstructorUsedError;
  String get givenName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDtoCopyWith<RegistrationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDtoCopyWith<$Res> {
  factory $RegistrationDtoCopyWith(
          RegistrationDto value, $Res Function(RegistrationDto) then) =
      _$RegistrationDtoCopyWithImpl<$Res, RegistrationDto>;
  @useResult
  $Res call(
      {String username,
      String emailAddress,
      String password,
      String familyName,
      String givenName});
}

/// @nodoc
class _$RegistrationDtoCopyWithImpl<$Res, $Val extends RegistrationDto>
    implements $RegistrationDtoCopyWith<$Res> {
  _$RegistrationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? familyName = null,
    Object? givenName = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegistrationDtoCopyWith<$Res>
    implements $RegistrationDtoCopyWith<$Res> {
  factory _$$_RegistrationDtoCopyWith(
          _$_RegistrationDto value, $Res Function(_$_RegistrationDto) then) =
      __$$_RegistrationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String emailAddress,
      String password,
      String familyName,
      String givenName});
}

/// @nodoc
class __$$_RegistrationDtoCopyWithImpl<$Res>
    extends _$RegistrationDtoCopyWithImpl<$Res, _$_RegistrationDto>
    implements _$$_RegistrationDtoCopyWith<$Res> {
  __$$_RegistrationDtoCopyWithImpl(
      _$_RegistrationDto _value, $Res Function(_$_RegistrationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? familyName = null,
    Object? givenName = null,
  }) {
    return _then(_$_RegistrationDto(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegistrationDto implements _RegistrationDto {
  const _$_RegistrationDto(
      {required this.username,
      required this.emailAddress,
      required this.password,
      required this.familyName,
      required this.givenName});

  factory _$_RegistrationDto.fromJson(Map<String, dynamic> json) =>
      _$$_RegistrationDtoFromJson(json);

  @override
  final String username;
  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final String familyName;
  @override
  final String givenName;

  @override
  String toString() {
    return 'RegistrationDto(username: $username, emailAddress: $emailAddress, password: $password, familyName: $familyName, givenName: $givenName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationDto &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, emailAddress, password, familyName, givenName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationDtoCopyWith<_$_RegistrationDto> get copyWith =>
      __$$_RegistrationDtoCopyWithImpl<_$_RegistrationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistrationDtoToJson(
      this,
    );
  }
}

abstract class _RegistrationDto implements RegistrationDto {
  const factory _RegistrationDto(
      {required final String username,
      required final String emailAddress,
      required final String password,
      required final String familyName,
      required final String givenName}) = _$_RegistrationDto;

  factory _RegistrationDto.fromJson(Map<String, dynamic> json) =
      _$_RegistrationDto.fromJson;

  @override
  String get username;
  @override
  String get emailAddress;
  @override
  String get password;
  @override
  String get familyName;
  @override
  String get givenName;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationDtoCopyWith<_$_RegistrationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
