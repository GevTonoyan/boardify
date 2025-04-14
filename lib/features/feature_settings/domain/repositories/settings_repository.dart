import 'package:boardify/features/feature_settings/domain/entities/settings_entity.dart';
import 'package:boardify/features/feature_settings/domain/usecases/update_setting_usecase.dart';

/// Repository interface for getting/changing app settings.
abstract interface class SettingsRepository {
  /// Gets the app settings.
  SettingsEntity getSettings();

  /// Updates a setting with the given [key] and [value].
  Future<bool> updateSetting(UpdateSettingParams params);
}
