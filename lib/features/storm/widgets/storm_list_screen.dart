import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:balatonivizeken/features/storm/providers/storm_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../error_widget/error_widget.dart';
import '../models/storm.model.dart';

// TODO test: ha bekerül egy új storm, megjelenik a képernyőn a listában?
class StormListScreen extends ConsumerStatefulWidget {
  const StormListScreen({super.key});

  @override
  ConsumerState<StormListScreen> createState() => _StormListScreenState();
}

class _StormListScreenState extends ConsumerState<StormListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stormListProvider.notifier).refreshStorms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stormList = ref.watch(stormListProvider);

    return stormList.when(
      data: (data) => StormListView(stormList: data),
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      ),
      loading: () {
        if (stormList.hasValue) {
          return StormListView(stormList: stormList.value!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class StormListView extends StatelessWidget {
  const StormListView({super.key, required this.stormList});

  final List<StormDto> stormList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: stormList.length,
          itemBuilder: (context, index) {
            final item = stormList[index];
            return Card(
              child: ListTile(
                tileColor: BalatoniVizekenColors.grey,
                title: Text(
                  '${item.area}, ${item.windDefinition}',
                  style: const TextStyle(
                    fontSize: 20.0, // Nagyobb betűméret
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item.timeLeft > 0 ? '${item.timeLeft} percen belül' : 'Most!',
                  style: const TextStyle(fontSize: 16.0),
                ),
                onTap: () => context.router.push(StormInfoRoute(storm: item)),
              ),
            );
          },
        ),
      ),
    );
  }
}
