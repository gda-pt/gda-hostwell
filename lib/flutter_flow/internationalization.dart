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
      'en': 'Welcome to Martha\'s House',
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
      'pt': '14/04/2025 - 15/04/2025',
    },
    'afgu0l3q': {
      'en': 'Check-In',
      'pt': 'Check-In',
    },
    'wvt2uw52': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Menu
  {
    'qj5rzuno': {
      'en': 'Visit Serra da Estrela',
      'pt': 'Visite a Serra da Estrela',
    },
    'uhlike50': {
      'en': 'The mountain range is so big.... Explore it :)',
      'pt': 'Expore a serra da estrela, tantos encantos para ver :)',
    },
    '4wiamn7a': {
      'en': 'Visit Mondego Walkways',
      'pt': 'Visite os Passadiços do Mondego',
    },
    'g9xmstxa': {
      'en': 'Step by step, closer to Guarda',
      'pt': 'Passo a passo, a um passo da Guarda',
    },
    'a3614fos': {
      'en': 'Where to Eat',
      'pt': 'Onde Comer',
    },
    '80c9f3mb': {
      'en': 'Check the local restaurants & supermarkets',
      'pt': 'Conheça os restaurantes locais e supermercados',
    },
    'bmmf6jt2': {
      'en': 'Martha\'s House',
      'pt': 'Casa da Martha',
    },
    'a7sja6ud': {
      'en': 'Guidance and house rules',
      'pt': 'Regras e orientações da Casa da Martha',
    },
    'coqor3uy': {
      'en': 'Breakfast',
      'pt': 'Pequeno-Almoço',
    },
    'dnmzn8iq': {
      'en': 'Enjoy your stay with a lovely breakfast',
      'pt': 'Relaxe e deixe o pequeno-almoço connosco',
    },
    'f9cdjvxu': {
      'en': 'Home',
      'pt': '',
    },
  },
  // VisitSerra
  {
    'xobmjfsl': {
      'en': 'Explore Serra da Estrela',
      'pt': 'Explora a Serra da Estrela',
    },
    '5lnzbl5b': {
      'en':
          'See below, some of the nicest places in Serra da Estrela, within 1 hour drive from the house!',
      'pt':
          'Veja abaixo. alguns dos lugares mais espetaculares da Serra da Estrela até 1 hora de distância.',
    },
    '1pcuzap4': {
      'en': 'Popular Places',
      'pt': 'Sítios Populares',
    },
    'ayewlm7w': {
      'en': 'Caldeirão Waterfall',
      'pt': 'Cascata do Caldeirão',
    },
    'x2xcgtvq': {
      'en': 'Rapa Swing',
      'pt': 'Baloiço da Rapa',
    },
    'jha1jdf8': {
      'en': 'Linhares da Beira',
      'pt': 'Linhares da Beira',
    },
    'q1pxupxf': {
      'en': 'D\'Ametade Cove',
      'pt': 'Covão D\'Ametade',
    },
    '3dy6l87d': {
      'en': 'Conchos Cove',
      'pt': 'Covão dos Conchos',
    },
    '8rpzxitk': {
      'en': 'Loriga Fluvial Beach',
      'pt': 'Praia Fluvíal da Loriga',
    },
    'xdi1a560': {
      'en': 'Home',
      'pt': '',
    },
  },
  // WhereToEat
  {
    '65i1jr0i': {
      'en': 'Where to Eat',
      'pt': 'Restaurantes',
    },
    'tmjrkkh8': {
      'en': 'Eat well, eat local',
      'pt': 'Coma bem, coma local',
    },
    'jmqpnjfj': {
      'en': 'Restaurants and Supermarkets',
      'pt': 'Restaurantes e Supermercados',
    },
    'euqe8pmj': {
      'en': 'Restaurante Muralha',
      'pt': 'Restaurante Muralha',
    },
    'ijchnkf0': {
      'en': 'Quinta de Santo António',
      'pt': 'Quinta de Santo António',
    },
    'pnyghf9z': {
      'en': 'Cortelha da Burra',
      'pt': 'Cortelha da Burra',
    },
    'ousz3kqm': {
      'en': 'Restaurante Nómada',
      'pt': 'Restaurante Nómada',
    },
    'dz3rtaui': {
      'en': 'Home',
      'pt': '',
    },
  },
  // VisitMondego
  {
    'skrxdtjh': {
      'en': 'Mondego Walkways',
      'pt': 'Passadiços do Mondego',
    },
    'zw65rw0k': {
      'en': 'Wanna walk and enjoy great views?',
      'pt': 'Quer passear e desfrutar de grandes vistas?',
    },
    'rcg4r6ux': {
      'en': 'Good to Know',
      'pt': 'Informação',
    },
    'xmnky2iv': {
      'en':
          'Visit the Mondego Walkways! 35 minutes drive from Martha\'s House and you\'ll find youself at the entrance of this magnificint walkway. Have a look to some of the photos below.\nPrice tickets are 1€ for each person. If your stay is more than 3 nights request in the below button your free tickets. Availability limited.',
      'pt':
          'Visite os Passadiços do Mondego! A 35 minutos de carro da Casa da Marta, você chegará à entrada deste magnífico passadiço. Veja algumas das fotos abaixo.\nO preço dos bilhetes é de 1€ por pessoa. Se a sua estadia for superior a 3 noites, solicite os seus bilhetes gratuitos no botão abaixo. Mediante disponibilidade.',
    },
    '1ji9zvcd': {
      'en': 'Home',
      'pt': '',
    },
  },
  // HomePageCheckedIn
  {
    'hd9h5d3t': {
      'en': 'Martha\'s House',
      'pt': 'Casa da Martha',
    },
    'rnvxyowq': {
      'en': 'License: 161459/AL',
      'pt': 'Licença: 161459/AL',
    },
    'dr6453f5': {
      'en': 'Hello Client X',
      'pt': 'Olá Cliente X',
    },
    'p2a64cts': {
      'en': 'Menu',
      'pt': 'Menu',
    },
    'nh179m4a': {
      'en': 'Support',
      'pt': 'Ajuda',
    },
    'dyr9px4v': {
      'en': 'Check-Out',
      'pt': 'Check-Out',
    },
    'xuq5db9e': {
      'en': 'Home',
      'pt': '',
    },
  },
  // CheckIn_International
  {
    '8ber3z7k': {
      'en': 'Check-In Information',
      'pt': 'Check-In',
    },
    '83qymhb9': {
      'en':
          'We\'re required to provide all non-national guests information to the authorities (formerly SEF now AIMA) \nIf you please, we would like you to fill this out using this form. \n\nBe advised, we do not store this information for any other purposes, we report and after that we delete this data.',
      'pt': '',
    },
    'hffuk4kw': {
      'en': 'Home',
      'pt': '',
    },
  },
  // RequestTickets
  {
    'lnk4gb85': {
      'en': 'Free Tickets',
      'pt': 'Obter Bilhetes',
    },
    '3nd1q7ge': {
      'en':
          'Please, introduce your mobile phone number (if you have whatsapp) or e-mail to receive the tickets.',
      'pt':
          'Introduza o seu número de telemóvel (caso tenha whatsapp) ou então um e-mail.',
    },
    's6bm1zmt': {
      'en': '',
      'pt': '',
    },
    '2jvd0wpj': {
      'en': 'TextField',
      'pt': '',
    },
    '7kf5q7ve': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'wx74bb9a': {
      'en': 'Request Tickets',
      'pt': 'Pedir Bilhetes',
    },
  },
  // CheckIn_Info
  {
    'ijwvrtx3': {
      'en': 'Are you Portuguese? If not, please fill in all the below fields.',
      'pt': '',
    },
    'r1mzy1hw': {
      'en': '',
      'pt': '',
    },
    '8dija4ga': {
      'en': 'First Name',
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
