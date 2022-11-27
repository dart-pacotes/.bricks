import 'package:dartz/dartz.dart';
import 'package:my_application_name/core/core.dart';
import 'package:my_application_name/data/data.dart';
import 'package:my_application_name/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesStorage implements Storage<String, String> {}

class SharedPreferencesStorage implements PreferencesStorage {
  final SharedPreferences sharedPreferences;

  const SharedPreferencesStorage({
    required this.sharedPreferences,
  });

  @override
  Future<Either<RequestError, void>> evict({
    required String key,
  }) {
    return safeAsyncThrowCall(
      () async {
        await sharedPreferences.remove(key);

        return const Right(null);
      },
      onError: (error, stackTrace) => WriteDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, String>> lookup({
    required String key,
    final bool lazyLoad = false,
  }) {
    return safeAsyncThrowCall(
      () async {
        final value = sharedPreferences.getString(key);

        if (value != null) {
          return Right(value);
        } else {
          return Left(
            ReadDeviceError(
              cause: 'there is no value for key: $key',
              stacktrace: StackTrace.current,
            ),
          );
        }
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, String>> store({
    required String key,
    required String data,
  }) {
    return safeAsyncThrowCall(
      () async {
        final stored = await sharedPreferences.setString(key, data);

        if (stored) {
          return Right(data);
        } else {
          return Left(
            WriteDeviceError(
              cause: 'could not set value: $data for key: $key',
              stacktrace: StackTrace.current,
            ),
          );
        }
      },
      onError: (error, stackTrace) => WriteDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, bool>> exists({
    required String key,
  }) {
    return safeAsyncThrowCall(
      () async {
        return Right(sharedPreferences.containsKey(key));
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }
}
