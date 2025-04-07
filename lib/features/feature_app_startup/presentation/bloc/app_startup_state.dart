part of 'app_startup_bloc.dart';

sealed class AppStartupState {
  const AppStartupState();
}

final class AppStartupInitial extends AppStartupState {
  const AppStartupInitial();
}

final class AppStartupLoading extends AppStartupState {
  const AppStartupLoading();
}

final class AppStartupLoaded extends AppStartupState {
  const AppStartupLoaded({required this.appStartupData});

  final AppStartupData appStartupData;
}

class AppStartupData {
  const AppStartupData({required this.isDarkMode, required this.locale});

  final bool isDarkMode;
  final AppLocales locale;

  AppStartupData copyWith({bool? isDarkMode, AppLocales? locale}) {
    return AppStartupData(isDarkMode: isDarkMode ?? this.isDarkMode, locale: locale ?? this.locale);
  }
}
