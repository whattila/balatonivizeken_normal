import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../api/backend/client/client.dart';
import '../../../../api/backend/providers/client_provider/client_provider.dart';
import '../../../../core/dio_error_handler.dart';
import '../../../snack/snack.dart';
import '../../models/sos_header.model.dart';

part 'sos_list.provider.g.dart';

@Riverpod(keepAlive: true)
class SosList extends _$SosList {
  @override
  Future<List<SosHeaderDto>> build() async => await api.getSos();

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> refreshSos() async {
    final sos = await api.getSos();
    state = state.when(
      data: (data) {
        return AsyncValue.data(sos);
      },
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }
}