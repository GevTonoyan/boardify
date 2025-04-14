import 'package:alias/features/feature_settings/domain/repositories/alias_settings_repository.dart';

/// Use case for updating alias setting
class UpdateAliasSettingUseCase {
  final AliasSettingsRepository _aliasSettingsRepository;

  UpdateAliasSettingUseCase(this._aliasSettingsRepository);

  Future<bool> call(UpdateAliasSettingParams params) async {
    return await _aliasSettingsRepository.updateAliasSettings(params);
  }
}

/// Parameters for updating alias setting
class UpdateAliasSettingParams {
  final String key;
  final Object value;

  const UpdateAliasSettingParams({required this.key, required this.value});
}
