import 'package:app_core/extensions/context_extension.dart';
import 'package:app_core/localizations/common/supported_locales.dart';
import 'package:app_core/ui_kit/widgets/circular_flag_icon.dart';
import 'package:boardify/features/feature_app_startup/presentation/bloc/app_startup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.appTheme;
    final colors = themeProvider.colors;
    final textStyles = themeProvider.typography;
    final bloc = context.read<AppStartupBloc>();
    final state = bloc.state;

    final isDark = state is AppStartupLoaded ? state.appStartupData.isDarkMode : false;

    final selectedLocale = state is AppStartupLoaded ? state.appStartupData.locale : AppLocales.en;

    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.settings, style: textStyles.headlineMedium)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 🔘 Dark Mode Toggle
          Card(
            color: colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colors.outline),
            ),
            child: SwitchListTile(
              title: Text(
                context.localizations.settings_darkMode,
                style: textStyles.titleMedium.copyWith(color: colors.onSurface),
              ),
              value: isDark,
              onChanged: (_) => bloc.add(ChangeAppTheme(!isDark)),
              secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode, color: colors.primary),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),

          const SizedBox(height: 16),

          // 🌐 Language Selector Card
          Card(
            color: colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colors.outline),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircularFlagIcon(assetPath: selectedLocale.flagAssetPath),
              title: Text(
                context.localizations.settings_localeName,
                style: textStyles.titleMedium.copyWith(color: colors.onSurface),
              ),
              trailing: Icon(Icons.arrow_drop_down, color: colors.primary),
              onTap: () => _showLocaleSelector(context),
            ),
          ),
        ],
      ),
    );
  }

  void _showLocaleSelector(BuildContext context) {
    final bloc = context.read<AppStartupBloc>();
    final state = bloc.state;
    final current = state is AppStartupLoaded ? state.appStartupData.locale : AppLocales.en;
    final theme = context.appTheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children:
              AppLocales.values.map((locale) {
                final isSelected = locale == current;
                return ListTile(
                  leading: CircularFlagIcon(assetPath: locale.flagAssetPath),
                  title: Text(
                    locale.name(context),
                    style: theme.typography.bodyMedium.copyWith(color: theme.colors.onSurface),
                  ),
                  trailing: isSelected ? Icon(Icons.check, color: theme.colors.primary) : null,
                  onTap: () {
                    context.pop();
                    bloc.add(ChangeAppLocale(locale));
                  },
                );
              }).toList(),
        );
      },
    );
  }
}
