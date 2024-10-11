import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/features/boat/boat.screen.dart';
import 'package:balatonivizeken/features/dashboard/dashboard.screen.dart';
import 'package:balatonivizeken/features/forgot_password/forgot_password.screen.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/login.screen.dart';
import 'package:balatonivizeken/features/landing_screens/register/register.screen.dart';
import 'package:balatonivizeken/features/map/map.screen.dart';
import 'package:flutter/material.dart';
import '../../features/sos/models/sos_alert.model.dart';
import '../../features/sos/sos_info_screen.dart';
import '../../features/storm/storm_info_screen.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginScreen,
      initial: true,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterScreen,
    ),
    AutoRoute(
      path: '/forgot_password',
      page: ForgotPasswordScreen,
    ),
    AutoRoute(
      path: '/dashboard',
      page: DashboardScreen,
      children: <AutoRoute>[
        AutoRoute(
          path: 'boat',
          page: BoatScreen,
        ),
        AutoRoute(
          path: 'map',
          page: MapScreen,
        ),
      ],
    ),
    AutoRoute(
      path: '/storm_info',
      page: StormInfoScreen,
    ),
    AutoRoute(
      path: '/sos_info',
      page: SosInfoScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
