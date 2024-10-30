import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../api/backend/providers/client_provider/client_provider.dart';
import '../../../../core/dio_error_handler.dart';
import '../../../sos/models/sos_alert.model.dart';

part 'sos.provider.g.dart';

@riverpod
Future<SosAlertDto> sosById(SosByIdRef ref, {required String id}) async {
  final balatoniVizekenClient = ref.watch(
    balatoniVizekenClientProvider(
      onError: (e, handler) => DioErrorHandler.handleErrorMessage(e),
    ),
  );

  final sosData = await balatoniVizekenClient.getSosById(id: id);
  return sosData;
}