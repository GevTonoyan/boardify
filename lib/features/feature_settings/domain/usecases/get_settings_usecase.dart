import 'package:boardify/features/feature_settings/domain/entities/settings_entity.dart';
import 'package:boardify/features/feature_settings/domain/repositories/settings_repository.dart';

/// Usecase to get the settings from the repository
class GetSettingsUseCase {
  final SettingsRepository _settingsRepository;

  GetSettingsUseCase(this._settingsRepository);

  SettingsEntity call() {
    return _settingsRepository.getSettings();
  }
}
