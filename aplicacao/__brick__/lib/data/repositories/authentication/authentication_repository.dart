import 'package:dartz/dartz.dart';
import 'package:{{name.lowerCase().snakeCase()}}/models/models.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthenticationError, void>> login({
    required final Credentials credentials,
  });

  Future<Either<AuthenticationError, String>> signup({
    required final Credentials credentials,
    final bool preventAutomaticLogin = false,
  });

  Future<Either<AuthenticationError, void>> logout();

  Future<Either<AuthenticationError, void>> requestPasswordReset({
    required final String email,
  });

  Future<Either<AuthenticationError, void>> resetPassword({
    required final String newPassword,
    required final String confirmationCode,
  });

  Future<Either<AuthenticationError, bool>> authenticated();
}

class FakeAuthenticationRepository extends AuthenticationRepository {
  @override
  Future<Either<AuthenticationError, void>> login({
    required final Credentials credentials,
  }) {
    return Future.value(
      const Right(null),
    );
  }

  @override
  Future<Either<AuthenticationError, String>> signup({
    required Credentials credentials,
    final bool preventAutomaticLogin = false,
  }) {
    return Future.value(
      const Right('uid'),
    );
  }

  @override
  Future<Either<AuthenticationError, void>> requestPasswordReset({
    required final String email,
  }) {
    return Future.value(
      const Right(null),
    );
  }

  @override
  Future<Either<AuthenticationError, void>> resetPassword({
    required String newPassword,
    required String confirmationCode,
  }) {
    return Future.value(
      const Right(null),
    );
  }

  @override
  Future<Either<AuthenticationError, bool>> authenticated() {
    return Future.value(
      const Right(false),
    );
  }

  @override
  Future<Either<AuthenticationError, void>> logout() {
    return Future.value(
      const Right(null),
    );
  }
}
