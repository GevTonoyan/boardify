part of 'app_startup_bloc.dart';

sealed class AppStartupEvent {
  const AppStartupEvent();
}

final class GetAppStartupData extends AppStartupEvent {
  const GetAppStartupData();
}

final class ChangeAppTheme extends AppStartupEvent {
  const ChangeAppTheme(this.isDarkMode);

  final bool isDarkMode;
}

final class ChangeAppLocale extends AppStartupEvent {
  const ChangeAppLocale(this.locale);

  final AppLocales locale;
}
