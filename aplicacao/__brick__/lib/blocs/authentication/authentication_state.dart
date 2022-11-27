part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

abstract class AuthenticationFailure extends AuthenticationState {
  final AuthenticationError error;

  AuthenticationFailure({
    required this.error,
  });
}

class AuthenticationInitial extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginInProgress extends AuthenticationState {}

class LoginFailure extends AuthenticationFailure {
  LoginFailure({
    required super.error,
  });
}

class SignupSuccess extends AuthenticationState {}

class SignupInProgress extends AuthenticationState {}

class SignupFailure extends AuthenticationFailure {
  SignupFailure({
    required super.error,
  });
}

class RequestPasswordResetInProgress extends AuthenticationState {}

class RequestPasswordResetSuccess extends AuthenticationState {}

class RequestPasswordResetFailure extends AuthenticationFailure {
  RequestPasswordResetFailure({
    required super.error,
  });
}

class ConfirmPasswordResetInProgress extends AuthenticationState {}

class ConfirmPasswordResetSuccess extends AuthenticationState {}

class ConfirmPasswordResetFailure extends AuthenticationFailure {
  ConfirmPasswordResetFailure({
    required super.error,
  });
}

class LogoutSuccess extends AuthenticationState {}

class LogoutInProgress extends AuthenticationState {}

class LogoutFailure extends AuthenticationFailure {
  LogoutFailure({
    required super.error,
  });
}
