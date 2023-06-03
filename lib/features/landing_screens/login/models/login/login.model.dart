import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.model.g.dart';
part 'login.model.freezed.dart';

@freezed
class LoginDto with _$LoginDto {
  const factory LoginDto({
    required String username,
    required String password
  }) = _LoginDto;
  
  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

}
