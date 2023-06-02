import 'package:balatonivizeken/features/account/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/account/models/user/user.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/models/login/login.model.dart';
import 'package:balatonivizeken/features/landing_screens/register/models/registration/registration.model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class BalatoniVizekenClient {
  factory BalatoniVizekenClient(Dio dio, {String baseUrl}) = _BalatoniVizekenClient;

  @POST('/auth/login')
  Future<UserDto> login({
    @Body() required LoginDto loginDto,
  });

  @POST('/auth/register')
  Future<UserDto> register({
    @Body() required RegistrationDto registrationDto,
  });
  @POST('/boat/update')
  Future<BoatDto> updateBoat({
    @Body() required BoatDto boatDto,
  });
  @GET('/boat')
  Future<List<BoatDto>> getBoats();
  @GET('/boat/by-boat-id/{id}')
  Future<BoatDto> getBoatById({
    @Path() required String id,
  });
  @GET('/boat/by-user-id/{id}')
  Future<BoatDto> getHistoricalDataAll({
    @Path() required String id,
  });
}
