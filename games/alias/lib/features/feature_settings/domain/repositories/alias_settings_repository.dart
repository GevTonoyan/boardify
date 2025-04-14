import 'package:alias/features/feature_settings/domain/entities/alias_settings_entity.dart';
import 'package:alias/features/feature_settings/domain/usecases/update_alias_setting_usecase.dart';

/// This is the interface for the [AliasSettingsRepository].
abstract interface class AliasSettingsRepository {
  /// This method is used to get the alias settings.
  Future<AliasSettingsEntity> getAliasSettings();

  /// This method is used to update the alias settings.
  Future<bool> updateAliasSettings(UpdateAliasSettingParams params);
}
