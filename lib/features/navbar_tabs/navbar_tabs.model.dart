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
    route: const BoatRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.sailing), label: 'Hajó'),
  ),
  NavbarTabs(
    route: const StormListRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.thunderstorm), label: 'Viharjelzések')
  ),
  NavbarTabs(
    route: const SosListRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'Segélyjelzések')
  )
];
