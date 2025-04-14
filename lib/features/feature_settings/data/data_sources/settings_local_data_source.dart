import 'package:boardify/core/constants.dart';
import 'package:boardify/features/feature_settings/domain/entities/settings_entity.dart';
import 'package:boardify/features/feature_settings/domain/usecases/update_setting_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local data source interface for getting/changing app settings.
abstract interface class SettingsLocalDataSource {
  SettingsEntity getSettings();

  /// Updates a setting with the given [key] and [value].
  Future<bool> updateSetting(UpdateSettingParams params);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences preferences;

  const SettingsLocalDataSourceImpl({required this.preferences});

  @override
  SettingsEntity getSettings() {
    final darkMode = preferences.getBool(AppConstants.appThemeKey) ?? false;
    final locale = preferences.getString(AppConstants.appLocaleKey);

    return SettingsEntity.fromPreferences(isDarkMode: darkMode, locale: locale);
  }

  @override
  Future<bool> updateSetting(UpdateSettingParams params) async {
    late final bool success;

    switch (params.key) {
      case AppConstants.appThemeKey:
        success = await preferences.setBool(params.key, params.value as bool);
      case AppConstants.appLocaleKey:
        success = await preferences.setString(params.key, params.value as String);
      default:
        success = false;
    }

    return success;
  }
}
