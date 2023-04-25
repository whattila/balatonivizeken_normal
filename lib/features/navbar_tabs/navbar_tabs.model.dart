import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:flutter/material.dart';

class NavbarTabs {
  final PageRouteInfo<dynamic> route;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavbarTabs({required this.route, required this.bottomNavigationBarItem});
}

final List<NavbarTabs> navbarTabs = [
  NavbarTabs(
    route: const MapRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Térkép'),
  ),
  NavbarTabs(
    route: const AccountRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Felhasználó'),
  ),
];
