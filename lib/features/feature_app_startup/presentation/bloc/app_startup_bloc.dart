import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_startup_event.dart';

part 'app_startup_state.dart';

class AppStartupBloc extends Bloc<AppStartupEvent, AppStartupState> {
  AppStartupBloc() : super(const AppStartupInitial()) {
    on<GetAppStartupData>(_onGetAppStartupData);
    on<ChangeAppTheme>(_onChangeAppTheme);
  }

  Future<void> _onGetAppStartupData(GetAppStartupData event, Emitter<AppStartupState> emit) async {
    emit(const AppStartupLoading());
    try {
      emit(const AppStartupLoaded(appStartupData: AppStartupData(isDarkMode: false)));
    } catch (e) {
      emit(const AppStartupInitial());
    }
  }

  FutureOr<void> _onChangeAppTheme(ChangeAppTheme event, Emitter<AppStartupState> emit) {
    emit(AppStartupLoaded(appStartupData: AppStartupData(isDarkMode: event.isDarkMode)));
  }
}
