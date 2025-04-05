import 'package:app_core/localizations/l10n/app_localizations.dart';
import 'package:app_core/localizations/localized_string.dart';
import 'package:app_core/ui_kit/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  AppThemeData get appTheme {
    final result = AppThemeProvider.of(this);
    return result;
  }

  AppLocalizations get localizations => AppLocalizations.of(this);

  AppLocalizations get l10n => AppLocalizations.of(this);

  Locale get locale => localizations.locale;
}
