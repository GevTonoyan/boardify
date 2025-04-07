import 'package:app_core/localizations/common/supported_locales.dart';
import 'package:app_core/localizations/l10n/app_localizations.dart';
import 'package:app_core/ui_kit/theme/app_theme/app_theme_data_builder.dart';
import 'package:app_core/ui_kit/theme/app_theme_provider.dart';
import 'package:app_core/ui_kit/theme/colors/app_dark_colors.dart';
import 'package:app_core/ui_kit/theme/colors/app_light_colors.dart';
import 'package:app_core/ui_kit/theme/text_styles/app_text_styles.dart';
import 'package:boardify/core/router/app_router.dart';
import 'package:boardify/features/feature_app_startup/presentation/bloc/app_startup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AppStartupBloc()..add(const GetAppStartupData()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStartupBloc, AppStartupState>(
      builder: (context, state) {
        final appColor =
            (state is AppStartupLoaded)
                ? state.appStartupData.isDarkMode
                    ? AppDarkColors()
                    : AppLightColors()
                : AppLightColors();

        final themeData = AppThemeData(
          colors: appColor,
          typography: AppTextStyles(),
          themeData: AppThemeDataBuilder(colors: appColor, textStyles: AppTextStyles()).build(),
        );

        return AppThemeProvider(
          data: themeData,
          child: MaterialApp.router(
            routerConfig: appRouter,
            title: 'Boardify',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocales.supportedLocales,
            locale:
                (state is AppStartupLoaded)
                    ? state.appStartupData.locale.locale
                    : AppLocales.en.locale,
            theme: themeData.themeData,
          ),
        );
      },
    );
  }
}
