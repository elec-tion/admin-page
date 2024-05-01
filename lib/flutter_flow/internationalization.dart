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
      'tr': 'Email Address',
      'en': '',
    },
    'sjzomt9g': {
      'tr': 'Enter your email here...',
      'en': '',
    },
    'x7hacm36': {
      'tr': 'Password',
      'en': '',
    },
    'vr644k8h': {
      'tr': 'Enter your email here...',
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
    'iui8vk35': {
      'tr': 'Use a social platform to continue',
      'en': '',
    },
    'kf187pts': {
      'tr': 'Don\'t have an account?',
      'en': '',
    },
    'y4c79vnl': {
      'tr': 'Create Account',
      'en': '',
    },
    'fjo4dpba': {
      'tr': 'Continue as Guest',
      'en': '',
    },
    'gykm7wwb': {
      'tr': 'Home',
      'en': '',
    },
  },
  // signUp
  {
    'rm9hx72d': {
      'tr': 'Get Started',
      'en': '',
    },
    '24gxp3q6': {
      'tr': 'Create an account by using the form below.',
      'en': '',
    },
    'hn9kib7r': {
      'tr': 'Email Address',
      'en': '',
    },
    '36e52du9': {
      'tr': 'Enter your email here...',
      'en': '',
    },
    'v78zfsqz': {
      'tr': 'Password',
      'en': '',
    },
    'gs79l7ef': {
      'tr': 'Enter your email here...',
      'en': '',
    },
    'kwxpblip': {
      'tr': 'Sign Up',
      'en': '',
    },
    'k511gwxh': {
      'tr': 'Use a social platform to continue',
      'en': '',
    },
    '91e5sm94': {
      'tr': 'Already have an account?',
      'en': '',
    },
    'nn88um63': {
      'tr': 'Login',
      'en': '',
    },
    'ctxn4flb': {
      'tr': 'Continue as Guest',
      'en': '',
    },
    '8f2njf4r': {
      'tr': 'Home',
      'en': '',
    },
  },
  // createProfile
  {
    'yi11ywsu': {
      'tr': 'Create Profile',
      'en': '',
    },
    '2f24llzu': {
      'tr': 'Your Name',
      'en': '',
    },
    'wr1zyvk7': {
      'tr': 'Your City',
      'en': '',
    },
    '9nk8ex1e': {
      'tr': 'State',
      'en': '',
    },
    'xjjl4fgl': {
      'tr': 'State',
      'en': '',
    },
    'f3lcxe2o': {
      'tr': 'Alabama',
      'en': '',
    },
    'n92rq7fa': {
      'tr': 'Alaska',
      'en': '',
    },
    '8pml5cj7': {
      'tr': 'Arizona',
      'en': '',
    },
    'fvuhspw4': {
      'tr': 'Arkansas',
      'en': '',
    },
    'g3lwb2cl': {
      'tr': 'California',
      'en': '',
    },
    'v7j8y5gf': {
      'tr': 'Colorado',
      'en': '',
    },
    '7fhw92vq': {
      'tr': 'Connecticut',
      'en': '',
    },
    'y4m1euj6': {
      'tr': 'Delaware',
      'en': '',
    },
    'nmgboper': {
      'tr': 'Florida',
      'en': '',
    },
    'hycmmcym': {
      'tr': 'Georgia',
      'en': '',
    },
    '1fahi99t': {
      'tr': 'Hawaii',
      'en': '',
    },
    'miw6o5os': {
      'tr': 'Idaho',
      'en': '',
    },
    'jrnkrzaa': {
      'tr': 'Illinoi',
      'en': '',
    },
    'geewr1lp': {
      'tr': 'Indiana',
      'en': '',
    },
    '89a1b7xu': {
      'tr': 'Iowa',
      'en': '',
    },
    'sdflua3j': {
      'tr': 'Kansas',
      'en': '',
    },
    'esa4wi7d': {
      'tr': 'Kentucky',
      'en': '',
    },
    'h6t8o63c': {
      'tr': 'Louisiana',
      'en': '',
    },
    'vdg0ka1o': {
      'tr': 'Maine',
      'en': '',
    },
    'ybut440h': {
      'tr': 'Maryland',
      'en': '',
    },
    'b2qzbwq4': {
      'tr': 'Massachusetts',
      'en': '',
    },
    'my5bxeqj': {
      'tr': 'Michigan',
      'en': '',
    },
    'a0csbwpe': {
      'tr': 'Minnesota',
      'en': '',
    },
    'cosr708r': {
      'tr': 'Mississippi',
      'en': '',
    },
    '68quxn5f': {
      'tr': 'Missouri',
      'en': '',
    },
    'gf1z5jor': {
      'tr': 'Monta',
      'en': '',
    },
    '5iotdox1': {
      'tr': 'Nebraska',
      'en': '',
    },
    '4fz9f66u': {
      'tr': 'Nevada',
      'en': '',
    },
    'vrgjn9oe': {
      'tr': 'New Hampshire',
      'en': '',
    },
    'h9i2z1be': {
      'tr': 'New Jersey',
      'en': '',
    },
    'xhms5w89': {
      'tr': 'New Mexico',
      'en': '',
    },
    'cilh53xu': {
      'tr': 'New York',
      'en': '',
    },
    'lo25dl8k': {
      'tr': 'North Carolina',
      'en': '',
    },
    '1cam34fe': {
      'tr': 'North Dak',
      'en': '',
    },
    'cmz0mb8k': {
      'tr': 'Ohio',
      'en': '',
    },
    'pkfw92u1': {
      'tr': 'Oklahoma',
      'en': '',
    },
    'a0gsdec5': {
      'tr': 'Oregon',
      'en': '',
    },
    'rsi85tgb': {
      'tr': 'Pennsylvani',
      'en': '',
    },
    '4hsov8jk': {
      'tr': 'Rhode Island',
      'en': '',
    },
    '3o5svbd8': {
      'tr': 'South Caroli',
      'en': '',
    },
    '8qa8ncea': {
      'tr': 'South Dakota',
      'en': '',
    },
    'kkcamuey': {
      'tr': 'Tennessee',
      'en': '',
    },
    'd5wwtc8k': {
      'tr': 'Texas',
      'en': '',
    },
    'rmucos5v': {
      'tr': 'Utah',
      'en': '',
    },
    'vvb8gk34': {
      'tr': 'Vermont',
      'en': '',
    },
    'jsbmvb77': {
      'tr': 'Virginia',
      'en': '',
    },
    'p9cyrt6z': {
      'tr': 'Washingto',
      'en': '',
    },
    'rwpf2axh': {
      'tr': 'West Virginia',
      'en': '',
    },
    '0surcqto': {
      'tr': 'Wisconsin',
      'en': '',
    },
    'rzna4065': {
      'tr': 'Wyoming',
      'en': '',
    },
    'miy4ydnd': {
      'tr': 'Select State',
      'en': '',
    },
    'yhingadd': {
      'tr': 'Your bio',
      'en': '',
    },
    '1sp337lt': {
      'tr': 'Save Changes',
      'en': '',
    },
    '6cb5f7s9': {
      'tr': 'Create Profile',
      'en': '',
    },
  },
  // phoneSignIn
  {
    'tphbvtky': {
      'tr': 'Phone Sign In',
      'en': '',
    },
    '6fm3t5h9': {
      'tr': 'Phone Sign In',
      'en': '',
    },
    'mt49lj74': {
      'tr': 'Type in your phone number below to register.',
      'en': '',
    },
    'jaa14b46': {
      'tr': 'Your Phone Number',
      'en': '',
    },
    'baaz8cvm': {
      'tr': 'Please enter a valid number...',
      'en': '',
    },
    't50wdnmj': {
      'tr': 'Sign In with Phone',
      'en': '',
    },
    't9bd3p2m': {
      'tr': 'Home',
      'en': '',
    },
  },
  // forgotPassword
  {
    '0li8667y': {
      'tr': 'Forgot Password',
      'en': '',
    },
    'g30fi9gh': {
      'tr': 'Forgot Password',
      'en': '',
    },
    'linkhb3l': {
      'tr':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'en': '',
    },
    'bwxk8lim': {
      'tr': 'Your email',
      'en': '',
    },
    '2z0oiai0': {
      'tr': 'Enter your email to recieve a linke...',
      'en': '',
    },
    '0ypp9jzq': {
      'tr': 'Send Reset Link',
      'en': '',
    },
    '15udw37i': {
      'tr': 'Home',
      'en': '',
    },
  },
  // phoneVerify
  {
    'qvfo4iku': {
      'tr': 'Confirm your Code',
      'en': '',
    },
    'g3z0s5iz': {
      'tr': 'Confirm your Code',
      'en': '',
    },
    'ysuael9k': {
      'tr': 'This code helps keep your account safe and secure.',
      'en': '',
    },
    'yc9rm3xe': {
      'tr': 'Confirm & Continue',
      'en': '',
    },
    'kpke021w': {
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
    '7whn4u0v': {
      'tr': 'Course Summary',
      'en': '',
    },
    'qdvza20j': {
      'tr': 'An overview of your courses.',
      'en': '',
    },
    'r1wo3pyn': {
      'tr': '23%',
      'en': '',
    },
    '8jpbemi8': {
      'tr': 'Course Progress',
      'en': '',
    },
    'eywnv1eb': {
      'tr': '93%',
      'en': '',
    },
    '42h4czpc': {
      'tr': 'Course Grade',
      'en': '',
    },
    '7ex8jt8w': {
      'tr': 'Active Users',
      'en': '',
    },
    '0gapj32p': {
      'tr': 'A small summary of your users base',
      'en': '',
    },
    'o9mkucxv': {
      'tr': 'Total User Count',
      'en': '',
    },
    '1kr6mz9u': {
      'tr': 'An overview of all your users on your platform.',
      'en': '',
    },
    'm2ylxnqr': {
      'tr': '56.4k',
      'en': '',
    },
    'i5sayknh': {
      'tr': 'Active Users',
      'en': '',
    },
    'u905u5z4': {
      'tr': 'A small summary of your users base',
      'en': '',
    },
    'zn6lmsyy': {
      'tr': 'Total User Count',
      'en': '',
    },
    'giwo5cwm': {
      'tr': 'An overview of all your users on your platform.',
      'en': '',
    },
    'ajb0vrqg': {
      'tr': '56.4k',
      'en': '',
    },
    'td4odtx2': {
      'tr': 'My Users',
      'en': '',
    },
    'l7h231qe': {
      'tr': 'Member Name',
      'en': '',
    },
    'vemoh92n': {
      'tr': 'Email',
      'en': '',
    },
    'ixq49d1q': {
      'tr': 'Last Active',
      'en': '',
    },
    'kwqbcbuf': {
      'tr': 'Date Created',
      'en': '',
    },
    'eo7te9h8': {
      'tr': 'Status',
      'en': '',
    },
    'h207hhgd': {
      'tr': 'Custom Name',
      'en': '',
    },
    'qb1swbfb': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'e0d98zex': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'tf55hb6m': {
      'tr': 'Active',
      'en': '',
    },
    'oq9jf5dv': {
      'tr': 'Custom Name',
      'en': '',
    },
    'ne96hx7r': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'a5rck25t': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'wbdx11gl': {
      'tr': 'Active',
      'en': '',
    },
    '1p31pbvt': {
      'tr': 'Custom Name',
      'en': '',
    },
    'a45scol3': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'ynpxg5yv': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'qmdjg72n': {
      'tr': 'Active',
      'en': '',
    },
    'ixuvax6s': {
      'tr': 'Custom Name',
      'en': '',
    },
    '8qzchcq4': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'jo87j4tc': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    '0xmw4r72': {
      'tr': 'Active',
      'en': '',
    },
    'vwqwtifr': {
      'tr': 'Custom Name',
      'en': '',
    },
    'z58yaxrh': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'q6yj2udf': {
      'tr': 'user@domainname.com',
      'en': '',
    },
    'jb00wqic': {
      'tr': 'Active',
      'en': '',
    },
    'er4lh3yy': {
      'tr': '•',
      'en': '',
    },
  },
  // courses
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
  // profilePage
  {
    'gvic0agz': {
      'tr': 'Profile',
      'en': '',
    },
    '2za7cp4i': {
      'tr': 'Below you will find a summary of your courses',
      'en': '',
    },
    'b91u5zvh': {
      'tr': 'Edit',
      'en': '',
    },
    'ofirytgk': {
      'tr': 'Account',
      'en': '',
    },
    '0ugpk174': {
      'tr': 'Switch to Dark Mode',
      'en': '',
    },
    'mztuxvdc': {
      'tr': 'Switch to Light Mode',
      'en': '',
    },
    'c0rehy65': {
      'tr': 'Country',
      'en': '',
    },
    'ypjboksd': {
      'tr': 'Edit Profile',
      'en': '',
    },
    'sbupgj5y': {
      'tr': 'General',
      'en': '',
    },
    'c53qb9y4': {
      'tr': 'Support',
      'en': '',
    },
    'gim7t1nl': {
      'tr': 'Terms of Service',
      'en': '',
    },
    'ia75xbtp': {
      'tr': 'Invite Friends',
      'en': '',
    },
    'nao4zuj3': {
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
      'tr': 'Courses',
      'en': '',
    },
    'iv629bxb': {
      'tr': 'Profile',
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
