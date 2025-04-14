import 'package:boardify/core/dependency_injection/di.dart';
import 'package:boardify/features/feature_settings/data/data_sources/settings_local_data_source.dart';
import 'package:boardify/features/feature_settings/data/repositories/settings_repository_impl.dart';
import 'package:boardify/features/feature_settings/domain/repositories/settings_repository.dart';
import 'package:boardify/features/feature_settings/domain/usecases/get_settings_usecase.dart';
import 'package:boardify/features/feature_settings/domain/usecases/update_setting_usecase.dart';

void injectFeatureSettingsScope() {
  /// Register the usecases
  sl
    ..registerLazySingleton<GetSettingsUseCase>(() => GetSettingsUseCase(sl()))
    ..registerLazySingleton<UpdateSettingUseCase>(() => UpdateSettingUseCase(sl()));

  /// Register the repositories
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(localDataSource: sl()));

  /// Register the data sources
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(preferences: sl()),
  );
}
