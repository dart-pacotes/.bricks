import 'package:{{name.lowerCase().snakeCase()}}/data/data.dart';

abstract class AuthenticationError extends RequestError {
  const AuthenticationError({
    required String cause,
    required StackTrace stacktrace,
  }) : super(cause: cause, stackTrace: stacktrace);

  static AuthenticationError from(RequestError error) {
    if (error is AuthenticationError) {
      return error;
    } else {
      return UnknownAuthenticationError(
        cause: error.cause,
        stacktrace: error.stackTrace,
      );
    }
  }
}

class InvalidCredentialsAuthenticationError extends AuthenticationError {
  const InvalidCredentialsAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Invalid Credentials', stacktrace: stacktrace);
}

class InvalidEmailAuthenticationError extends AuthenticationError {
  const InvalidEmailAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Invalid Email', stacktrace: stacktrace);
}

class EmailAlreadyInUseAuthenticationError extends AuthenticationError {
  const EmailAlreadyInUseAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Email Already In Use', stacktrace: stacktrace);
}

class WeakPasswordAuthenticationError extends AuthenticationError {
  const WeakPasswordAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Weak Password', stacktrace: stacktrace);
}

class UserDisabledAuthenticationError extends AuthenticationError {
  const UserDisabledAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'User Disabled', stacktrace: stacktrace);
}

class UserNotFoundAuthenticationError extends AuthenticationError {
  const UserNotFoundAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'User Not Found', stacktrace: stacktrace);
}

class WrongPasswordAuthenticationError extends AuthenticationError {
  const WrongPasswordAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Wrong Password', stacktrace: stacktrace);
}

class ExpiredConfirmationCodeAuthenticationError extends AuthenticationError {
  const ExpiredConfirmationCodeAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Expired Confirmation Code', stacktrace: stacktrace);
}

class InvalidConfirmationCodeAuthenticationError extends AuthenticationError {
  const InvalidConfirmationCodeAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Invalid Confirmation Code', stacktrace: stacktrace);
}

class OperationNotAllowedAuthenticationError extends AuthenticationError {
  const OperationNotAllowedAuthenticationError({
    required StackTrace stacktrace,
  }) : super(cause: 'Operation Not Allowed', stacktrace: stacktrace);
}

class UnknownAuthenticationError extends AuthenticationError {
  UnknownAuthenticationError({
    final String? cause,
    required StackTrace stacktrace,
  }) : super(
          cause: 'Unknown Error on Authentication: ${cause?.toString() ?? ''}',
          stacktrace: stacktrace,
        );
}
