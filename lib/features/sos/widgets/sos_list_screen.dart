import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/router/router.dart';
import '../../error_widget/error_widget.dart';
import '../models/sos_header.model.dart';
import '../providers/list/sos_list.provider.dart';

// TODO test: ha bekerül egy új sos, megjelenik a képernyőn a listában?
class SosListScreen extends ConsumerWidget {
  const SosListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sosList = ref.watch(sosListProvider);

    return sosList.when(
      data: (data) => SosListView(sosList: data),
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      ),
      loading: () {
        if (sosList.hasValue) {
          return SosListView(sosList: sosList.value!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class SosListView extends StatelessWidget {
  const SosListView({super.key, required this.sosList});

  final List<SosHeaderDto> sosList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: sosList.length,
          itemBuilder: (context, index) {
            final item = sosList[index];
            return Card(
              child: ListTile(
                tileColor: BalatoniVizekenColors.grey,
                title: Text(
                  '${item.timePassed} perccel ezelőtt',
                  style: const TextStyle(
                    fontSize: 20.0, // Nagyobb betűméret
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => context.router.push(SosInfoRoute(sosHeader: item)),
              ),
            );
          },
        ),
      ),
    );
  }
}