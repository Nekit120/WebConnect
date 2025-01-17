import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_connect/data/shared_preferences_settings_repository.dart';
import 'package:web_connect/domain/router/route_names.dart';
import 'package:web_connect/presentation/error/error_view.dart';
import 'package:web_connect/presentation/main/main_view.dart';

import '../../presentation/error/error_page.dart';
import '../../presentation/splash/presentation/splash_page.dart';

//I don't use di to keep it simple

final GoRouter routes = GoRouter(
  initialLocation: '/${RouteNames.splash}',
  redirect: (context, state) async {
    return null;
  },
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: '/${RouteNames.splash}',
      builder: (context, state) => SplashPage(
        settingsRepository: SharedPreferencesSettingsRepository(),
      ),
    ),
    GoRoute(
      name: RouteNames.error,
      path: '/${RouteNames.error}',
      builder: (context, state) => ErrorPage(),
    ),
    GoRoute(
      name: RouteNames.main,
      path: '/${RouteNames.main}',
      builder: (context, state) => MainView(),
    ),
  ],
);
