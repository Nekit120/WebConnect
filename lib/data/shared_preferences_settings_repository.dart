// обычно использовал бы 2 файла repositoryImpl and shared_preferences,но для скорости так
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository/settings_repository.dart';

class SharedPreferencesSettingsRepository implements SettingsRepository {
  static const String _internetKey = 'internet_status';

  @override
  Future<void> saveInternetStatus(bool hasInternet) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_internetKey, hasInternet);
  }

  @override
  Future<bool?> getInternetStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_internetKey);
  }
}
