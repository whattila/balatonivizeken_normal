import 'package:balatonivizeken/api/backend/api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
Api balatoniVizekenApi(
  BalatoniVizekenApiRef ref, {
  void Function(DioError e, ErrorInterceptorHandler handler)? onError,
}) {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:3000'));
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
      onError: (e, handler) {
        if (onError != null) {
          onError(e, handler);
        }
        print('Error - Http status: ${e.response?.statusCode} - data: ${e.response?.data}');

        return handler.next(e);
      },
    ),
  );
  return Api(dio: dio);
}
