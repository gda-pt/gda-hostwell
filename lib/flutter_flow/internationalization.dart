import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'jwjlglse': {
      'en': 'Welcome to Casa da Martha',
      'pt': 'Bem-Vindo à Casa da Martha',
    },
    'dn57jig0': {
      'en': 'License: 161459/AL',
      'pt': 'Licença: 161459/AL',
    },
    'b40nfwqg': {
      'en': 'Booking Details',
      'pt': 'Detalhes da Reserva',
    },
    't2a3dnq3': {
      'en': 'Client X',
      'pt': 'Cliente X',
    },
    '72u96cw0': {
      'en': '14/04/2025 - 15/04/2025',
      'pt': '',
    },
    'afgu0l3q': {
      'en': 'Check-In',
      'pt': 'Check-In',
    },
    'r14spshq': {
      'en': 'Options',
      'pt': 'Opções',
    },
    'wvt2uw52': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Guests
  {
    'c0s63653': {
      'en': 'check.io',
      'pt': '',
    },
    'bj2y16hk': {
      'en': 'Andrew D.',
      'pt': '',
    },
    'rkn3wcjn': {
      'en': 'admin@gmail.com',
      'pt': '',
    },
    'xdi1a560': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    '16acilq4': {
      'en': '',
      'pt': '',
    },
    'higk167y': {
      'en': '',
      'pt': '',
    },
    'zcuntw5s': {
      'en': '',
      'pt': '',
    },
    'xy34ec98': {
      'en': '',
      'pt': '',
    },
    'wy622ic2': {
      'en': '',
      'pt': '',
    },
    'nzeka8hz': {
      'en': '',
      'pt': '',
    },
    'zv7zzr4f': {
      'en': '',
      'pt': '',
    },
    'cceyi7ld': {
      'en': '',
      'pt': '',
    },
    'u9pkt0gj': {
      'en': '',
      'pt': '',
    },
    'wxur8u09': {
      'en': '',
      'pt': '',
    },
    '5uix7log': {
      'en': '',
      'pt': '',
    },
    'p9rirec9': {
      'en': '',
      'pt': '',
    },
    'iz9zemeh': {
      'en': '',
      'pt': '',
    },
    'fuga1e7y': {
      'en': '',
      'pt': '',
    },
    'yx59bkjt': {
      'en': '',
      'pt': '',
    },
    'fkkznx6a': {
      'en': '',
      'pt': '',
    },
    'hyshdh9q': {
      'en': '',
      'pt': '',
    },
    'x4sfopfu': {
      'en': '',
      'pt': '',
    },
    'zjdpwsqs': {
      'en': '',
      'pt': '',
    },
    'zqqqr5wl': {
      'en': '',
      'pt': '',
    },
    'sp3r81pq': {
      'en': '',
      'pt': '',
    },
    'crwwdij2': {
      'en': '',
      'pt': '',
    },
    't6o9o5ux': {
      'en': '',
      'pt': '',
    },
    '8ed6k5qd': {
      'en': '',
      'pt': '',
    },
    's7szqb5v': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
