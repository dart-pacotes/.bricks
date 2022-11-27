import 'package:intl/intl.dart';
import 'package:my_application_name/models/models.dart';
import 'package:my_application_name/presentation/widgets/widgets.dart';
import 'messages/messages_all.dart';

const kDefaultLocale = Locale('en');

const supportedLocales = [
  kDefaultLocale,
  Locale('pt'),
];

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  final String localeName;

  const AppLocalizations(this.localeName);

  static Future<AppLocalizations> load(Locale locale) {
    final name = '${locale.countryCode}'.isEmpty
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '"Hello" word',
      locale: localeName,
    );
  }

  String greet(String value) {
    return Intl.message(
      'Hello $value!',
      name: 'greet',
      desc: 'Parameterized greet statement',
      locale: localeName,
      args: [value],
    );
  }

  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: 'Title of home view',
      locale: localeName,
    );
  }

  String get open {
    return Intl.message(
      'Open',
      name: 'openTitle',
      desc: '"Open" word',
      locale: localeName,
    );
  }

  String get invalidEmailError {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmailError',
      desc: 'Error message for invalid email fields',
      locale: localeName,
    );
  }

  String get invalidEmailOnAuthenticationError {
    return Intl.message(
      'Invalid e-mail pattern.',
      name: 'invalidEmailOnAuthenticationError',
      desc: 'Describes the reason for the error case of invalid email',
      locale: localeName,
    );
  }

  String get weakPasswordOnAuthenticationError {
    return Intl.message(
      'Weak password. Please try with a stronger password',
      name: 'weakPasswordOnAuthenticationError',
      desc: 'Describes the reason for the error case of weak password',
      locale: localeName,
    );
  }

  String get operationNotAllowedOnAuthenticationError {
    return Intl.message(
      'An issue occurred while processing some data. Don\'t worry, this is an issue on our end.',
      name: 'operationNotAllowedOnAuthenticationError',
      desc: 'Describes the reason for the error case of operation not allowed',
      locale: localeName,
    );
  }

  String get unknownErrorOnAuthenticationError {
    return Intl.message(
      'An issue occurred while processing some data. Don\'t worry, this is an issue on our end.',
      name: 'unknownErrorOnAuthenticationError',
      desc: 'Describes the reason for an unknown authentication error',
      locale: localeName,
    );
  }

  String get invalidCredentialsOnAuthenticationError {
    return Intl.message(
      'Invalid credentials.',
      name: 'invalidCredentialsOnAuthenticationError',
      desc: 'Describes the reason for the error case of invalid credentials',
      locale: localeName,
    );
  }

  String get userDisabledAuthenticationError {
    return Intl.message(
      'User is disabled.',
      name: 'userDisabledAuthenticationError',
      desc: 'Describes the reason for the error case of user disabled',
      locale: localeName,
    );
  }

  String get userNotFoundAuthenticationError {
    return Intl.message(
      'User not found.',
      name: 'userNotFoundAuthenticationError',
      desc: 'Describes the reason for the error case of user not found',
      locale: localeName,
    );
  }

  String get wrongPasswordAuthenticationError {
    return Intl.message(
      'Wrong password.',
      name: 'wrongPasswordAuthenticationError',
      desc: 'Describes the reason for the error case of wrong password',
      locale: localeName,
    );
  }

  String get expiredConfirmationCodeAuthenticationError {
    return Intl.message(
      'Expired confirmation code.',
      name: 'expiredConfirmationCodeAuthenticationError',
      desc:
          'Describes the reason for the error case of expired confirmation code',
      locale: localeName,
    );
  }

  String get invalidConfirmationCodeAuthenticationError {
    return Intl.message(
      'Invalid confirmation code.',
      name: 'invalidConfirmationCodeAuthenticationError',
      desc:
          'Describes the reason for the error case of invalid confirmation code',
      locale: localeName,
    );
  }

  String get emailAlreadyInUseAuthenticationError {
    return Intl.message(
      'Email already in use.',
      name: 'emailAlreadyInUseAuthenticationError',
      desc: 'Describes the reason for the error case of email already in use',
      locale: localeName,
    );
  }

  String authenticationError(final AuthenticationError error) {
    switch (error.runtimeType) {
      case InvalidEmailAuthenticationError:
        return invalidEmailOnAuthenticationError;
      case WeakPasswordAuthenticationError:
        return weakPasswordOnAuthenticationError;
      case OperationNotAllowedAuthenticationError:
        return operationNotAllowedOnAuthenticationError;
      case InvalidCredentialsAuthenticationError:
        return invalidCredentialsOnAuthenticationError;
      case UserDisabledAuthenticationError:
        return userDisabledAuthenticationError;
      case UserNotFoundAuthenticationError:
        return userNotFoundAuthenticationError;
      case WrongPasswordAuthenticationError:
        return wrongPasswordAuthenticationError;
      case ExpiredConfirmationCodeAuthenticationError:
        return expiredConfirmationCodeAuthenticationError;
      case InvalidConfirmationCodeAuthenticationError:
        return invalidConfirmationCodeAuthenticationError;
      default:
        return unknownErrorOnAuthenticationError;
    }
  }

  String signupError(final AuthenticationError error) {
    switch (error.runtimeType) {
      case InvalidEmailAuthenticationError:
        return invalidEmailOnAuthenticationError;
      case WeakPasswordAuthenticationError:
        return weakPasswordOnAuthenticationError;
      case OperationNotAllowedAuthenticationError:
        return operationNotAllowedOnAuthenticationError;
      case InvalidCredentialsAuthenticationError:
        return invalidCredentialsOnAuthenticationError;
      case UserDisabledAuthenticationError:
        return userDisabledAuthenticationError;
      case UserNotFoundAuthenticationError:
        return userNotFoundAuthenticationError;
      case WrongPasswordAuthenticationError:
        return wrongPasswordAuthenticationError;
      case ExpiredConfirmationCodeAuthenticationError:
        return expiredConfirmationCodeAuthenticationError;
      case InvalidConfirmationCodeAuthenticationError:
        return invalidConfirmationCodeAuthenticationError;
      case EmailAlreadyInUseAuthenticationError:
        return emailAlreadyInUseAuthenticationError;
      default:
        return unknownErrorOnAuthenticationError;
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(
    Locale locale,
  ) =>
      supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
