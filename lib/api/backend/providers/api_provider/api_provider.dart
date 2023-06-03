import 'dart:io';

import 'package:balatonivizeken/api/backend/api.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

class _Helper {
  static Future<void> refreshAndRetry(
    Dio dio,
    BalatoniVizekenApiRef ref, {
    required Response<dynamic> response,
    required DioError e,
    required ErrorInterceptorHandler handler,
  }) async {
    final isAuthIssue = response.statusCode == 401;

    if (isAuthIssue) {
      final RequestOptions options = response.requestOptions;
      try {
        final accessToken = await ref.read(userStorageProvider).getToken();

        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

        final Response<dynamic> response = await dio.fetch(options);

        return handler.resolve(response);
      } catch (e, s) {}
    }
    return handler.next(e);
  }
}

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
        print('${e.method}: ${e.path}, data: ${e.data}, query :${e.queryParameters}');
        return handler.next(e);
      },
      onError: (e, handler) async {
        if (onError != null) {
          onError(e, handler);
        }
        final response = e.response;

        if (response == null) {
          return handler.next(e);
        }

        await _Helper.refreshAndRetry(
          dio,
          ref,
          response: response,
          e: e,
          handler: handler,
        );
      },
    ),
  );
  return Api(dio: dio);
}
