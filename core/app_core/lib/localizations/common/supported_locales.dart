import 'package:flutter/material.dart';

enum AppLocales {
  english,
  russian,
  armenian;

  Locale get locale {
    switch (this) {
      case AppLocales.english:
        return const Locale('en');
      case AppLocales.russian:
        return const Locale('ru');
      case AppLocales.armenian:
        return const Locale('am');
    }
  }

  String get name {
    switch (this) {
      case AppLocales.english:
        return 'English';
      case AppLocales.russian:
        return 'Russian';
      case AppLocales.armenian:
        return 'Armenian';
    }
  }

  static List<Locale> get supportedLocales {
    return AppLocales.values.map((locale) => locale.locale).toList();
  }

  String get flagAssetPath {
    switch (this) {
      case AppLocales.english:
        return 'assets/icons/flags/usa.svg';
      case AppLocales.russian:
        return 'assets/icons/flags/russia.svg';
      case AppLocales.armenian:
        return 'assets/icons/flags/armenia.svg';
    }
  }
}
