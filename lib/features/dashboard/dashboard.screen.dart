import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/navbar_tabs/navbar_tabs.model.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _body(BuildContext context) {
    return AutoTabsScaffold(
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
                      //TODO _logout()
                      context.router.pop()
                    }),
          ],
          //TODO change to icon later
          title: const Text(
            "BalatoniVizeken",
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
  Widget build(BuildContext context) {
    return _body(context);
  }
}
