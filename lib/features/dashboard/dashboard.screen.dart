import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:balatonivizeken/features/location_update/providers/location_update.provider.dart';
import 'package:balatonivizeken/features/navbar_tabs/navbar_tabs.model.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  Widget _body(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false, //new line

      routes: navbarTabs.map((tab) => tab.route).toList(),
      backgroundColor: BalatoniVizekenColors.darkBlue,
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              onPressed: () => {
                ref.read(userStorageProvider).clear(),
                ref.read(locationUpdateProvider.notifier).cancelTimer(),
                context.router.replaceAll([LoginRoute()]),
              },
            ),
          ],
          //TODO change to icon later
          title: const Text(
            "Balatoni Vizeken",
          ),
          automaticallyImplyLeading: false,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            tabsRouter.setActiveIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: BalatoniVizekenColors.lightBlack,
          selectedItemColor: BalatoniVizekenColors.white,
          unselectedItemColor: BalatoniVizekenColors.lightGrey,
          items: navbarTabs.map((tab) => tab.bottomNavigationBarItem).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _body(context, ref);
  }
}
