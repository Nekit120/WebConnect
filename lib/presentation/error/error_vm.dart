import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:reactive_variables/reactive_variables.dart';

class ErrorViewModel {
  final Rv<int?> batteryLevel = null.rv();
  late Timer _timer;
  final Battery _battery = Battery();

  void init() {
    _startBatteryLevelUpdate();
  }

  void dispose() {
    _timer.cancel();
  }

  void _startBatteryLevelUpdate() {
    _checkBatteryLevel();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      _checkBatteryLevel();
    });
  }

  Future<void> _checkBatteryLevel() async {
    int level = await _battery.batteryLevel;
    batteryLevel.value = level;
  }
}
