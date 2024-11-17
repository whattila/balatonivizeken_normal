import 'dart:async';
import 'package:balatonivizeken/features/sos/models/sos_input.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/backend/providers/client_provider/client_provider.dart';
import '../../../../core/dio_error_handler.dart';
import '../../../boat/providers/boat/boat.provider.dart';
import '../../../gps_switch/providers/location/location.provider.dart';
import '../../../snack/snack.dart';
import '../../../storage/user_storage/user_storage_provider/user_storage.provider.dart';

part 'send_sos.provider.g.dart';

@riverpod
class SendSos extends _$SendSos {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> sendSos() async {
    final api = ref.read(
      balatoniVizekenClientProvider(
        onError: (e, handler) {
          DioErrorHandler.handleErrorMessage(e);
          Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
        },
      ),
    );

    final userStorage = ref.read(userStorageProvider);
    final user = (await userStorage.getUser())!;
    final boat = ref.read(boatProvider);
    final location = ref.read(locationProvider);
    final currentTime = DateTime.now().toIso8601String();

    final sos = SosInputDto(
        userId: user.id!,
        boatId: boat.value!.id!,
        longitude: location.longitude,
        latitude: location.latitude,
        date: currentTime
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => api.sendSos(sos: sos));
  }
}