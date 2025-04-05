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
  const AppStartupData({required this.isDarkMode});

  final bool isDarkMode;
}
