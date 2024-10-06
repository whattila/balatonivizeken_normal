import 'package:balatonivizeken/api/backend/client/client.dart';
import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/api/backend/sse.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/boat/models/user/user.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/models/login/login.model.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';

part 'login.provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  Option<Result<Option<UserDto>, Object>> build() {
    state = const None();
    return state;
  }

  BalatoniVizekenClient get api => ref.read(
        balatoniVizekenClientProvider(
          onError: (e, handler) {
            Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
          },
        ),
      );

  Future<void> _handleData({required UserDto data}) async {
    final tokenStorage = ref.read(userStorageProvider);
    await tokenStorage.set(data);

    subscribeToStormAlerts();

    state = Some(Ok(Some(data)));
  }

  Future<void> login({required String username, required String password}) async {
    state = const Some(Ok(None()));
    try {
      final data = await api.login(
        loginDto: LoginDto(
          username: username,
          password: password,
        ),
      );
      await _handleData(data: data);
    } catch (e) {
      state = Some(Err(e));
    }
  }
}
