import 'package:alias/features/feature_settings/domain/entities/alias_settings_entity.dart';
import 'package:alias/features/feature_settings/domain/repositories/alias_settings_repository.dart';

class GetAliasSettingsUseCase {
  final AliasSettingsRepository aliasSettingsRepository;

  GetAliasSettingsUseCase(this.aliasSettingsRepository);

  Future<AliasSettingsEntity> call() async {
    return await aliasSettingsRepository.getAliasSettings();
  }
}
