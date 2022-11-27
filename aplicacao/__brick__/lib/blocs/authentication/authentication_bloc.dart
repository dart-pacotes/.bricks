import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application_name/data/data.dart';
import 'package:my_application_name/models/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        final credentials = Credentials.email(
          email: event.email,
          password: event.password,
        );

        emit(LoginInProgress());

        final result = await authenticationRepository.login(
          credentials: credentials,
        );

        emit(
          result.fold(
            (error) => LoginFailure(
              error: AuthenticationError.from(error),
            ),
            (response) => LoginSuccess(),
          ),
        );
      },
    );

    on<SignupEvent>(
      (event, emit) async {
        final credentials = Credentials.email(
          email: event.email,
          password: event.password,
        );

        emit(SignupInProgress());

        final result = await authenticationRepository.signup(
          credentials: credentials,
        );

        emit(
          result.fold(
            (error) => SignupFailure(
              error: AuthenticationError.from(error),
            ),
            (response) => SignupSuccess(),
          ),
        );
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        emit(LogoutInProgress());

        final result = await authenticationRepository.logout();

        emit(
          result.fold(
            (error) => LogoutFailure(
              error: error,
            ),
            (response) => LogoutSuccess(),
          ),
        );
      },
    );

    on<RequestPasswordResetEvent>(
      (event, emit) async {
        emit(RequestPasswordResetInProgress());

        final result = await authenticationRepository.requestPasswordReset(
          email: event.email,
        );

        emit(
          result.fold(
            (error) => RequestPasswordResetFailure(
              error: AuthenticationError.from(error),
            ),
            (response) => RequestPasswordResetSuccess(),
          ),
        );
      },
    );

    on<ConfirmPasswordResetEvent>(
      (event, emit) async {
        emit(ConfirmPasswordResetInProgress());

        final result = await authenticationRepository.resetPassword(
          confirmationCode: event.code,
          newPassword: event.newPassword,
        );

        emit(
          result.fold(
            (error) => ConfirmPasswordResetFailure(
              error: AuthenticationError.from(error),
            ),
            (response) => ConfirmPasswordResetSuccess(),
          ),
        );
      },
    );
  }
}
