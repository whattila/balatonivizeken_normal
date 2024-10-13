// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ForgotPasswordScreen(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    StormInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StormInfoRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StormInfoScreen(
          storm: args.storm,
          key: args.key,
        ),
      );
    },
    SosInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SosInfoRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SosInfoScreen(
          sos: args.sos,
          key: args.key,
        ),
      );
    },
    BoatRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BoatScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
    StormListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StormListScreen(),
      );
    },
    SosListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SosListScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/login',
          fullMatch: true,
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
        RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot_password',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            RouteConfig(
              BoatRoute.name,
              path: 'boat',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              MapRoute.name,
              path: 'map',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              StormListRoute.name,
              path: 'storm_list',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              SosListRoute.name,
              path: 'sos_list',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          StormInfoRoute.name,
          path: '/storm_info',
        ),
        RouteConfig(
          SosInfoRoute.name,
          path: '/sos_info',
        ),
      ];
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key})
      : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({Key? key})
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot_password',
          args: ForgotPasswordRouteArgs(key: key),
        );

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [StormInfoScreen]
class StormInfoRoute extends PageRouteInfo<StormInfoRouteArgs> {
  StormInfoRoute({
    required StormDto storm,
    Key? key,
  }) : super(
          StormInfoRoute.name,
          path: '/storm_info',
          args: StormInfoRouteArgs(
            storm: storm,
            key: key,
          ),
        );

  static const String name = 'StormInfoRoute';
}

class StormInfoRouteArgs {
  const StormInfoRouteArgs({
    required this.storm,
    this.key,
  });

  final StormDto storm;

  final Key? key;

  @override
  String toString() {
    return 'StormInfoRouteArgs{storm: $storm, key: $key}';
  }
}

/// generated route for
/// [SosInfoScreen]
class SosInfoRoute extends PageRouteInfo<SosInfoRouteArgs> {
  SosInfoRoute({
    required SosAlertDto sos,
    Key? key,
  }) : super(
          SosInfoRoute.name,
          path: '/sos_info',
          args: SosInfoRouteArgs(
            sos: sos,
            key: key,
          ),
        );

  static const String name = 'SosInfoRoute';
}

class SosInfoRouteArgs {
  const SosInfoRouteArgs({
    required this.sos,
    this.key,
  });

  final SosAlertDto sos;

  final Key? key;

  @override
  String toString() {
    return 'SosInfoRouteArgs{sos: $sos, key: $key}';
  }
}

/// generated route for
/// [BoatScreen]
class BoatRoute extends PageRouteInfo<void> {
  const BoatRoute()
      : super(
          BoatRoute.name,
          path: 'boat',
        );

  static const String name = 'BoatRoute';
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute()
      : super(
          MapRoute.name,
          path: 'map',
        );

  static const String name = 'MapRoute';
}

/// generated route for
/// [StormListScreen]
class StormListRoute extends PageRouteInfo<void> {
  const StormListRoute()
      : super(
          StormListRoute.name,
          path: 'storm_list',
        );

  static const String name = 'StormListRoute';
}

/// generated route for
/// [SosListScreen]
class SosListRoute extends PageRouteInfo<void> {
  const SosListRoute()
      : super(
          SosListRoute.name,
          path: 'sos_list',
        );

  static const String name = 'SosListRoute';
}
