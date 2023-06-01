import 'package:dio/dio.dart';

class Api {
  Api({required this.dio});
  final Dio dio;

  Dio get instance => dio;
}
