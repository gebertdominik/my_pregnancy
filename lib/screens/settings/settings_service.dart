import 'package:my_pregnancy/models/user_settings.dart';
import 'package:my_pregnancy/repositories/user_settings_repository.dart';

class UserSettingsService {
  final UserSettingsRepository _userSettingsRepository =
      UserSettingsRepository();

  Future<UserSettings> getUserSettings(String userId) {
    return _userSettingsRepository.getUserSettings(userId);
  }

  Future<void> updateUserSettings(UserSettings userSettings) {
    return _userSettingsRepository.updateUserSettings(userSettings);
  }
}
