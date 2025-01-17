import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:web_connect/domain/repository/settings_repository.dart';
import 'package:web_connect/domain/router/route_names.dart';

import '../../../data/shared_preferences_settings_repository.dart';

class SplashViewModel {
  final SettingsRepository _settingsRepository;
  SplashViewModel({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> redirect(BuildContext context) async {
    final sharedPreferencesSettingsRepository =
        SharedPreferencesSettingsRepository();
    final internetStatus =
        await sharedPreferencesSettingsRepository.getInternetStatus();

    if (internetStatus == null || internetStatus == false) {
      final hasInternet = await checkInternetConnection();
      await sharedPreferencesSettingsRepository.saveInternetStatus(hasInternet);

      if (hasInternet) {
        context.goNamed(RouteNames.main);
      } else {
        context.goNamed(RouteNames.error);
      }
    }

    if (internetStatus!) {
      context.goNamed(RouteNames.main);
    } else {
      context.goNamed(RouteNames.error);
    }
  }
}
