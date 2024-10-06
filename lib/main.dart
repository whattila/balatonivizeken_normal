import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/consts.dart';
import 'package:balatonivizeken/core/router/router.provider.dart';
import 'package:balatonivizeken/features/notification/notification.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

StormDto? stormFromLauncherNotification;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotifications.init();
  final NotificationAppLaunchDetails? notificationAppLaunchDetails = await LocalNotifications.getNotificationAppLaunchDetails();
  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    final notificationResponse = notificationAppLaunchDetails?.notificationResponse;
    if (notificationResponse?.id == LocalNotifications.stormNotificationId) {
      stormFromLauncherNotification = StormDto.fromJson(jsonDecode(notificationResponse!.payload!) as Map<String, dynamic>);
    }
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _showStormFromLauncherNotification();
    _configureStormNotificationSubject();
  }

  Future<void> _showStormFromLauncherNotification() async {
    if (stormFromLauncherNotification != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await _goToStormInfoScreen(stormFromLauncherNotification!);
      });
    }
  }

  void _configureStormNotificationSubject() {
    LocalNotifications.stormNotificationStream.stream.listen((StormDto storm) async {
      await _goToStormInfoScreen(storm);
    });
  }

  Future<void> _goToStormInfoScreen(StormDto storm) async {
    final router = ref.read(routerProvider);
    await router.push(StormInfoRoute(storm: storm));
  }

  @override
  void dispose() {
    LocalNotifications.stormNotificationStream.close();
    super.dispose();
  }

  // Itt tárolhatod az állapotot, ha szükséges
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider); // ref használata az állapotból

    return MaterialApp.router(
      scaffoldMessengerKey: globalKey,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: BalatoniVizekenColors.lightBlack),
        brightness: Brightness.dark,
        listTileTheme: ListTileThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        primaryColor: const Color(0xff0d6efd),
        scaffoldBackgroundColor: BalatoniVizekenColors.darkBlue,
        cardColor: BalatoniVizekenColors.lightBlack,
        drawerTheme: const DrawerThemeData(backgroundColor: BalatoniVizekenColors.lightBlack),
        dialogBackgroundColor: BalatoniVizekenColors.lightBlack,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: BalatoniVizekenColors.lightBlack,
          contentTextStyle: TextStyle(color: Colors.white),
          shape: StadiumBorder(),
        ),
      ),
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Balatoni Vizeken',
      routerDelegate: AutoRouterDelegate(router, navigatorObservers: () => [AutoRouteObserver()]),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
