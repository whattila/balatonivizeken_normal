import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/consts.dart';
import 'package:balatonivizeken/core/router/router.provider.dart';
import 'package:balatonivizeken/features/notification/notification.dart';
import 'package:balatonivizeken/features/sos/models/sos_alert.model.dart';
import 'package:balatonivizeken/features/sos/models/sos_header.model.dart';
import 'package:balatonivizeken/features/storage/user_storage/user_storage_provider/user_storage.provider.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

StormDto? stormFromLauncherNotification;
// TODO: SosAlertDto sosFromLauncherNotification; // ennek megnézése előtt ellenőriznünk kéne, hogy a felhasználó be van jelentkezve, és ha nem, be kéne jelentkeztetnünk...

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
      child: BalatonivizekenApp(),
    ),
  );
}

class BalatonivizekenApp extends ConsumerStatefulWidget {
  const BalatonivizekenApp({super.key});

  @override
  ConsumerState<BalatonivizekenApp> createState() => _BalatonivizekenAppState();
}

class _BalatonivizekenAppState extends ConsumerState<BalatonivizekenApp> {
  @override
  void initState() {
    super.initState();
    _showStormFromLauncherNotification();
    _configureStormNotificationSubject();
    _configureSosNotificationSubject();
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
  
  void _configureSosNotificationSubject() {
    LocalNotifications.sosNotificationStream.stream.listen((SosAlertDto sos) async {
      await _goToSosInfoScreen(sos);
    });
  }
  
  Future<void> _goToSosInfoScreen(SosAlertDto sos) async {
    final userStorage = ref.read(userStorageProvider);
    final user = await userStorage.getUser();
    if (user != null) {
      final router = ref.read(routerProvider);
      await router.push(SosInfoRoute(
            sosHeader: SosHeaderDto(
                id: sos.id,
                longitude: sos.longitude,
                latitude: sos.latitude,
                date: sos.date,
                userId: sos.userId,
                boatId: sos.boatId,
                phoneNumber: sos.phoneNumber
            )
        )
      );
    }
  }

  @override
  void dispose() {
    LocalNotifications.stormNotificationStream.close();
    LocalNotifications.sosNotificationStream.close();
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
