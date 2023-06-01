import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/api_provider/api_provider.dart';
import 'package:dio/dio.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_provider.g.dart';

/// Provides [BalatoniVizekenClient] to allow API calls via.
@riverpod
BalatoniVizekenClient balatoniVizekenClient(
  BalatoniVizekenClientRef ref, {
  void Function(DioError, ErrorInterceptorHandler)? onError,
}) {
  final api = ref.watch(balatoniVizekenApiProvider(onError: onError));
  final client = BalatoniVizekenClient(api.instance);
  return client;
}
