import 'package:boardify/features/feature_settings/data/data_sources/settings_local_data_source.dart';
import 'package:boardify/features/feature_settings/domain/entities/settings_entity.dart';
import 'package:boardify/features/feature_settings/domain/repositories/settings_repository.dart';
import 'package:boardify/features/feature_settings/domain/usecases/update_setting_usecase.dart';

/// Implementation of the [SettingsRepository] interface.
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  const SettingsRepositoryImpl({required this.localDataSource});

  @override
  SettingsEntity getSettings() {
    final settings = localDataSource.getSettings();
    return settings;
  }

  @override
  Future<bool> updateSetting(UpdateSettingParams params) async {
    final result = await localDataSource.updateSetting(params);
    return result;
  }
}
