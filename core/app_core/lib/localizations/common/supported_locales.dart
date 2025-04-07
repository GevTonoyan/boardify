import 'package:app_core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

enum AppLocales {
  en,
  ru,
  am;

  Locale get locale {
    switch (this) {
      case AppLocales.en:
        return const Locale('en');
      case AppLocales.ru:
        return const Locale('ru');
      case AppLocales.am:
        return const Locale('am');
    }
  }

  static List<Locale> get supportedLocales {
    return AppLocales.values.map((locale) => locale.locale).toList();
  }

  String name(BuildContext context) {
    switch (this) {
      case AppLocales.en:
        return context.localizations.settings_localeEnglish;
      case AppLocales.ru:
        return context.localizations.settings_localeRussian;
      case AppLocales.am:
        return context.localizations.settings_localeArmenian;
    }
  }

  String get flagAssetPath {
    switch (this) {
      case AppLocales.en:
        return 'assets/icons/flags/us.svg';
      case AppLocales.ru:
        return 'assets/icons/flags/ru.svg';
      case AppLocales.am:
        return 'assets/icons/flags/am.svg';
    }
  }
}
