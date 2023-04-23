import 'package:auto_route/auto_route.dart';

import 'package:balatonivizeken/features/landing_screens/login/login.screen.dart';
import 'package:balatonivizeken/features/landing_screens/register/register.screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/public/login',
      page: LoginScreen,
      initial: true,
    ),
    AutoRoute(
      path: '/public/register',
      page: RegisterScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
