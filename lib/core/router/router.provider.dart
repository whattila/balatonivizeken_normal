import 'package:balatonivizeken/core/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.provider.g.dart';

@riverpod
AppRouter router(RouterRef appRouterRef) => AppRouter();
