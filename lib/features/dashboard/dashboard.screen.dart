import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:balatonivizeken/features/location_update/providers/location_update.provider.dart';
import 'package:balatonivizeken/features/navbar_tabs/navbar_tabs.model.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../alerts/alerts_service.provider.dart';
import '../sos/providers/send/send_sos.provider.dart';

// TODO test: a kilépésre nyomva: lefut az SSE-ről leiratkozó függvény? null lesz a user? megszűnik a Timer aktív lenni?
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _sosButton() {
    return Positioned(
      top: 100,
      right: 10,
      child: ElevatedButton(
        onPressed: () {
          ref.read(sendSosProvider.notifier).sendSos();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: const Text('SOS'),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        AutoTabsScaffold(
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
                    ref.read(alertsServiceProvider).unsubscribeFromAlerts(),
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
        ),
        _sosButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }
}
