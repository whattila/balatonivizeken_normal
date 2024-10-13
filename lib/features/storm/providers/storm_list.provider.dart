import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../api/backend/client/client.dart';
import '../../../api/backend/providers/client_provider/client_provider.dart';
import '../../../core/dio_error_handler.dart';
import '../../snack/snack.dart';
import '../models/storm.model.dart';

part 'storm_list.provider.g.dart';

@Riverpod(keepAlive: true)
class StormList extends _$StormList {
  @override
  Future<List<StormDto>> build() async
    => await api.getStorms()..sort((a, b) => _compareStormsByDate(a, b));

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> refreshStorms() async {
    final storms = await api.getStorms()..sort((a, b) => _compareStormsByDate(a, b));
    state = state.when(
      data: (data) {
        return AsyncValue.data(storms);
      },
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }

  int _compareStormsByDate(StormDto a, StormDto b) {
    DateTime aDate = DateTime.parse(a.date);
    DateTime bDate = DateTime.parse(b.date);
    return -1 * aDate.compareTo(bDate); // we multiply with -1 to get the later date first
  }
}