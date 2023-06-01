import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class BalatoniVizekenClient {
  factory BalatoniVizekenClient(Dio dio, {String baseUrl}) = _BalatoniVizekenClient;

  @POST('/auth/register')
  

 
}
