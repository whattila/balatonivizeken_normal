import 'dart:io';

import 'package:balatonivizeken/api/backend/api.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
Api balatoniVizekenApi(
  BalatoniVizekenApiRef ref, {
  void Function(DioError e, ErrorInterceptorHandler handler)? onError,
}) {
  final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000'));
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (e, handler) {
        print('Http status: ${e.statusCode} - data: ${e.data}');
        return handler.next(e);
      },
      onRequest: (e, handler) async {
        final accessToken = await ref.read(userStorageProvider).getToken();
        if (accessToken != null) {
          e.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
        }
        return handler.next(e);
      },
      onError: (e, handler) async {
        if (onError != null) {
          onError(e, handler);
        }

        return handler.next(e);
      },
    ),
  );
  return Api(dio: dio);
}
