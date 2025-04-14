part of 'settings_bloc.dart';

sealed class SettingsEvent {
  const SettingsEvent();
}

class GetSettings extends SettingsEvent {
  const GetSettings();
}

class ChangeTheme extends SettingsEvent {
  const ChangeTheme(this.isDarkMode);

  final bool isDarkMode;
}

class ChangeLocale extends SettingsEvent {
  const ChangeLocale(this.locale);

  final AppLocales locale;
}
