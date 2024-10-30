import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/user/user.model.dart';
import 'package:balatonivizeken/features/gps_switch/models/gps_enabled.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/models/login/login.model.dart';
import 'package:balatonivizeken/features/landing_screens/register/models/registration/registration.model.dart';
import 'package:balatonivizeken/features/map/model/location/location.model.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/model/no_go_zone/no_go_zone.model.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../features/sos/models/sos_alert.model.dart';
import '../../../features/sos/models/sos_header.model.dart';
import '../../../features/sos/models/sos_input.model.dart';

part 'client.g.dart';

@RestApi()
abstract class BalatoniVizekenClient {
  factory BalatoniVizekenClient(Dio dio, {String baseUrl}) = _BalatoniVizekenClient;

  @POST('/auth/login')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<UserDto> login({
    @Body() required LoginDto loginDto,
  });

  @POST('/auth/register')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<UserDto> register({
    @Body() required RegistrationDto registrationDto,
  });

  @POST('/boat/update')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<BoatDto> updateBoat({
    @Body() required BoatDto boatDto,
  });

  @GET('/boat')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<MarkerDto>> getMarkers({
    @Body() required LocationDto centerPoint,
  });

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
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<void> updateLocation({
    @Path() required String id,
    @Body() required LocationDto location,
  });

  @POST('/boat/gps/{id}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<void> updateGpsEnabled({
    @Path() required String id,
    @Body() required GpsEnabledDto gpsEnabled,
  });

  @POST('/sos/send')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<void> sendSos({
    @Body() required SosInputDto sos,
  });
  
  @GET('/storm')
  Future<List<StormDto>> getStorms();

  // TODO: ennél a kettőnél elfelejtettük, hogy egyébként csak a közelünkben lévőkre lenne szükség...

  @GET('/sos')
  Future<List<SosHeaderDto>> getSos();

  @GET('/sos/by-id/{id}')
  Future<SosAlertDto> getSosById({
    @Path() required String id,
  });
}
