import 'package:balatonivizeken/api/backend/providers/client_provider/client_provider.dart';
import 'package:balatonivizeken/core/dio_error_handler.dart';
import 'package:balatonivizeken/features/landing_screens/register/models/registration/registration.model.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';

part 'register.provider.g.dart';

@riverpod
class Register extends _$Register {
  @override
  Option<Result<Option<void>, Object>> build() {
    return const None();
  }

  Future<void> register({required RegistrationDto registrationDto}) async {
    final api = ref.read(
      balatoniVizekenClientProvider(
        onError: (e, handler) {
          DioErrorHandler.handleErrorMessage(e);
          Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
        },
      ),
    );
    try {
      state = const Some(Ok(None()));
      await api.register(registrationDto: registrationDto);
      state = const Some(Ok(Some(null)));
    } catch (e) {
      state = Some(Err(e));
    }
  }
}
