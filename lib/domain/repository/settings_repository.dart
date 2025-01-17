abstract class SettingsRepository {
  Future<void> saveInternetStatus(bool hasInternet);
  Future<bool?> getInternetStatus();
}
