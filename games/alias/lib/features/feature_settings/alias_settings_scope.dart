import 'package:alias/features/feature_settings/data/data_sources/alias_settings_local_data_source.dart';
import 'package:alias/features/feature_settings/data/repositories/alias_settings_repository_impl.dart';
import 'package:alias/features/feature_settings/domain/repositories/alias_settings_repository.dart';
import 'package:alias/features/feature_settings/domain/usecases/update_alias_setting_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/usecases/get_alias_settings_usecase.dart';

final sl = GetIt.instance;

Future<void> injectAliasSettingsScope() async {
  if (sl.isRegistered<AliasSettingsRepository>()) {
    return;
  }

  // Register the use case
  sl
    ..registerLazySingleton<GetAliasSettingsUseCase>(() => GetAliasSettingsUseCase(sl()))
    ..registerLazySingleton<UpdateAliasSettingUseCase>(() => UpdateAliasSettingUseCase(sl()));

  // Register the repository
  sl.registerLazySingleton<AliasSettingsRepository>(
    () => AliasSettingsRepositoryImpl(dataSource: sl()),
  );

  // Register the data source
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<AliasSettingsLocalDataSource>(
    () => AliasSettingsLocalDataSourceImpl(preferences: sharedPreferences),
  );
}
