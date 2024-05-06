import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['tr', 'en'];

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
    String? trText = '',
    String? enText = '',
  }) =>
      [trText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // signIn
  {
    '3tuueux4': {
      'tr': 'Welcome Back!',
      'en': '',
    },
    'szqvxn39': {
      'tr': 'Use the form below to access your account.',
      'en': '',
    },
    '5goowcap': {
      'tr': 'ID',
      'en': '',
    },
    'sjzomt9g': {
      'tr': 'Enter your ID here...',
      'en': '',
    },
    'x7hacm36': {
      'tr': 'Password',
      'en': '',
    },
    'vr644k8h': {
      'tr': 'Enter your password here...',
      'en': '',
    },
    'o1ik1s8l': {
      'tr': 'Forgot Password?',
      'en': '',
    },
    'bfbbex90': {
      'tr': 'Sign In',
      'en': '',
    },
    'gykm7wwb': {
      'tr': 'Home',
      'en': '',
    },
  },
  // homePage
  {
    '2th408k2': {
      'tr': 'Dashboard',
      'en': '',
    },
    'j352akis': {
      'tr': 'Your project status is appearing here.',
      'en': '',
    },
    'o9mkucxv': {
      'tr': 'Total User Count',
      'en': '',
    },
    '8okodhrd': {
      'tr': 'Total Election Count',
      'en': '',
    },
    'mlkvilsn': {
      'tr': 'Total Candidates Count',
      'en': '',
    },
    'rgun29oo': {
      'tr': 'Total x Count',
      'en': '',
    },
    'yzb0bx6c': {
      'tr': '31',
      'en': '',
    },
    'fbspwxn5': {
      'tr': 'Elections',
      'en': '',
    },
    'jad2d0o2': {
      'tr': 'Election Name',
      'en': '',
    },
    'fewd278m': {
      'tr': 'Start Date',
      'en': '',
    },
    'nx1rwc49': {
      'tr': 'End Date',
      'en': '',
    },
    'g1sxqbr0': {
      'tr': 'District',
      'en': '',
    },
    'r9eccyxl': {
      'tr': 'Status',
      'en': '',
    },
    'wfdbqljh': {
      'tr': 'Not Started',
      'en': '',
    },
    'x6j4dmvb': {
      'tr': 'Started',
      'en': '',
    },
    'wv9vj84s': {
      'tr': 'Finished',
      'en': '',
    },
    'er4lh3yy': {
      'tr': '•',
      'en': '',
    },
  },
  // elections
  {
    'amtpdf0q': {
      'tr': 'Your Courses',
      'en': '',
    },
    '29btn8pw': {
      'tr': 'Below you will find a summary of your courses.',
      'en': '',
    },
    'tkpd3m6j': {
      'tr': 'Add Course',
      'en': '',
    },
    'mi31k3q8': {
      'tr': 'Your Top Classes',
      'en': '',
    },
    'lhkwui1s': {
      'tr': 'No-Code Platform Design',
      'en': '',
    },
    'wfunamg9': {
      'tr': '12 Projects',
      'en': '',
    },
    'k54nmhw1': {
      'tr': '21 students',
      'en': '',
    },
    'bmiclelw': {
      'tr': 'Code for no-coders',
      'en': '',
    },
    'vsrqyvzy': {
      'tr': '12 Projects',
      'en': '',
    },
    'ncsw5mdp': {
      'tr': '16 students',
      'en': '',
    },
    '8enu9wk8': {
      'tr': '•',
      'en': '',
    },
  },
  // users
  {
    '09o2u7l4': {
      'tr': 'Your Courses',
      'en': '',
    },
    '90uhff29': {
      'tr': 'Below you will find a summary of your courses.',
      'en': '',
    },
    'oczm45ot': {
      'tr': 'Add Course',
      'en': '',
    },
    '4t50ql5q': {
      'tr': 'Your Top Classes',
      'en': '',
    },
    'co2bw7rn': {
      'tr': 'No-Code Platform Design',
      'en': '',
    },
    '0bxv0t7c': {
      'tr': '12 Projects',
      'en': '',
    },
    'mecrbrqs': {
      'tr': '21 students',
      'en': '',
    },
    'tawjt00o': {
      'tr': 'Code for no-coders',
      'en': '',
    },
    '6kuosj2x': {
      'tr': '12 Projects',
      'en': '',
    },
    '51subkc0': {
      'tr': '16 students',
      'en': '',
    },
    'du2uiezw': {
      'tr': '•',
      'en': '',
    },
  },
  // sideBarNav
  {
    'mygsiguk': {
      'tr': 'Menu',
      'en': '',
    },
    'azaftggi': {
      'tr': 'Dashboard',
      'en': '',
    },
    'r19qzkrd': {
      'tr': 'Elections',
      'en': '',
    },
    'hwpwn78q': {
      'tr': 'Users',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ekxg2ygl': {
      'tr': '',
      'en': '',
    },
    'vecyl698': {
      'tr': '',
      'en': '',
    },
    'urwx972l': {
      'tr': '',
      'en': '',
    },
    'cr2njlu0': {
      'tr': '',
      'en': '',
    },
    'oh393gdv': {
      'tr': '',
      'en': '',
    },
    'fi77pjtc': {
      'tr': '',
      'en': '',
    },
    'g85sx3ug': {
      'tr': '',
      'en': '',
    },
    '75rsfwlp': {
      'tr': '',
      'en': '',
    },
    'zsndqatg': {
      'tr': '',
      'en': '',
    },
    'qpt32u43': {
      'tr': '',
      'en': '',
    },
    'h0kq0lz8': {
      'tr': '',
      'en': '',
    },
    'q2ezejre': {
      'tr': '',
      'en': '',
    },
    'dji3ffyu': {
      'tr': '',
      'en': '',
    },
    'p8ngmrsf': {
      'tr': '',
      'en': '',
    },
    'wrdy9ma6': {
      'tr': '',
      'en': '',
    },
    'gog8mfsm': {
      'tr': '',
      'en': '',
    },
    'trqfco5u': {
      'tr': '',
      'en': '',
    },
    'j33lupax': {
      'tr': '',
      'en': '',
    },
    '6m9tv9im': {
      'tr': '',
      'en': '',
    },
    'lizg5exa': {
      'tr': '',
      'en': '',
    },
    '03w1nb90': {
      'tr': '',
      'en': '',
    },
    'j30za3sw': {
      'tr': '',
      'en': '',
    },
    'zgn49hwa': {
      'tr': '',
      'en': '',
    },
    'u900pxk7': {
      'tr': '',
      'en': '',
    },
    'toibiujd': {
      'tr': '',
      'en': '',
    },
    '3i6my2ig': {
      'tr': '',
      'en': '',
    },
    '6os88uvm': {
      'tr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
