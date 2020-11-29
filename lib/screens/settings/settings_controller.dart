import 'package:my_pregnancy/models/user_settings.dart';
import 'package:my_pregnancy/screens/settings/settings_service.dart';

class SettingsController {
  UserSettingsService _userSettingsService = new UserSettingsService();

  Future<UserSettings> fetchUserSettings(String userId) async {
    return _userSettingsService.getUserSettings(userId);
  }

  void updateUserSettings(UserSettings userSettings){
    _userSettingsService.updateUserSettings(userSettings);
  }
}
