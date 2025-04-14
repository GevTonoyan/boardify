import 'package:alias/features/feature_settings/data/data_sources/alias_settings_local_data_source.dart';
import 'package:alias/features/feature_settings/domain/entities/alias_settings_entity.dart';
import 'package:alias/features/feature_settings/domain/repositories/alias_settings_repository.dart';
import 'package:alias/features/feature_settings/domain/usecases/update_alias_setting_usecase.dart';

/// This is the implementation of the [AliasSettingsRepository] interface.
class AliasSettingsRepositoryImpl implements AliasSettingsRepository {
  final AliasSettingsLocalDataSource dataSource;

  const AliasSettingsRepositoryImpl({required this.dataSource});

  @override
  Future<AliasSettingsEntity> getAliasSettings() async {
    return await dataSource.getAliasSettings();
  }

  @override
  Future<bool> updateAliasSettings(UpdateAliasSettingParams params) async {
    final result = await dataSource.updateAliasSetting(params);
    return result;
  }
}
