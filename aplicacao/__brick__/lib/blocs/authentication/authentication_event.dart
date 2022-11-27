part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;

  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignupEvent extends AuthenticationEvent {
  final String email;

  final String password;

  SignupEvent({
    required this.email,
    required this.password,
  });
}

class RequestPasswordResetEvent extends AuthenticationEvent {
  final String email;

  RequestPasswordResetEvent({
    required this.email,
  });
}

class ConfirmPasswordResetEvent extends AuthenticationEvent {
  final String code;

  final String newPassword;

  ConfirmPasswordResetEvent({
    required this.code,
    required this.newPassword,
  });
}

class LogoutEvent extends AuthenticationEvent {}
