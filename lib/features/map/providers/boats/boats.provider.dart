import 'dart:async';

import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boats.provider.g.dart';

@riverpod
Future<List<BoatDto>> boats(
  BoatsRef ref,
) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final boatsData = await balatoniVizekenClient.getBoats();

  return boatsData;
}
