import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/repository/settings_repository.dart';
import 'splash_view.dart';
import 'splash_vm.dart';

class SplashPage extends StatelessWidget {
  final SettingsRepository _settingsRepository;

  const SplashPage({super.key, required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          SplashViewModel(settingsRepository: _settingsRepository),
      child: const SplashView(),
    );
  }
}
