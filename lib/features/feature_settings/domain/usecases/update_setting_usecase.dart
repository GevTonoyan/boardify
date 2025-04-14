import 'package:boardify/features/feature_settings/domain/repositories/settings_repository.dart';

class UpdateSettingUseCase {
  final SettingsRepository settingsRepository;

  const UpdateSettingUseCase(this.settingsRepository);

  Future<bool> call(UpdateSettingParams params) async {
    final result = await settingsRepository.updateSetting(params);
    return result;
  }
}

class UpdateSettingParams {
  final String key;
  final Object value;

  const UpdateSettingParams({required this.key, required this.value});
}
