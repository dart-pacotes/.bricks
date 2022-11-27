import 'package:dartz/dartz.dart';
import 'package:{{name.lowerCase().snakeCase()}}/data/data.dart';
import 'package:{{name.lowerCase().snakeCase()}}/logging/logging.dart';

Either<Object, R> safeSyncThrowCall<R>(
  Either<Object, R> Function() call,
) {
  try {
    return call();
  } on Object catch (error, stacktrace) {
    logError(error, stacktrace: stacktrace);

    return Left(error);
  }
}

Future<Either<L, R>> safeAsyncThrowCall<L extends RequestError, R>(
  Future<Either<L, R>> Function() call, {
  RequestError Function(Object error, StackTrace stackTrace)? onError,
}) async {
  try {
    return await call();
  } on Object catch (error, stacktrace) {
    logError(error, stacktrace: stacktrace);

    return Left(
      (onError?.call(error, stacktrace) ??
          UnknownError(
            cause: error.toString(),
            stackTrace: stacktrace,
          )) as L,
    );
  }
}

Stream<Either<L, R>> safeStreamThrowCall<L extends RequestError, R>(
  Stream<Either<L, R>> Function() call,
) async* {
  try {
    yield* call();
  } on Object catch (error, stacktrace) {
    logError(error, stacktrace: stacktrace);

    yield Left(
      UnknownError(
        cause: error.toString(),
        stackTrace: stacktrace,
      ) as L,
    );
  }
}
