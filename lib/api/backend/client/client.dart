import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/user/user.model.dart';
import 'package:balatonivizeken/features/gps_switch/models/gps_enabled.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/models/login/login.model.dart';
import 'package:balatonivizeken/features/landing_screens/register/models/registration/registration.model.dart';
import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/model/no_go_zone/no_go_zone.model.dart';
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
  Future<List<MarkerDto>> getMarkers();

  @GET('/zone')
  Future<List<NoGoZone>> getZones();

  @GET('/boat/by-boat-id/{id}')
  Future<BoatDto> getBoatById({
    @Path() required String id,
  });

  @GET('/boat/by-user-id/{id}')
  Future<BoatDto?> getBoatByUserId({
    @Path() required String id,
  });

  @POST('/boat/location/{id}')
  Future<void> updateLocation({
    @Path() required String id,
    @Body() required LocationDto location,
  });

  @POST('/boat/gps/{id}')
  Future<void> updateGpsEnabled({
    @Path() required String id,
    @Body() required GpsEnabledDto gpsEnabled,
  });
}
