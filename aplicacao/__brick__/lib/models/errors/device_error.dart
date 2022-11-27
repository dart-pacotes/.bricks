import 'package:my_application_name/data/data.dart';

abstract class DeviceError extends RequestError {
  const DeviceError({
    required String cause,
    required StackTrace stacktrace,
  }) : super(cause: cause, stackTrace: stacktrace);
}

class ReadDeviceError extends DeviceError {
  const ReadDeviceError({
    final String? cause,
    required StackTrace stacktrace,
  }) : super(
          cause: cause ?? 'Could not read device data',
          stacktrace: stacktrace,
        );
}

class WriteDeviceError extends DeviceError {
  const WriteDeviceError({
    final String? cause,
    required StackTrace stacktrace,
  }) : super(
          cause: cause ?? 'Could not write device data',
          stacktrace: stacktrace,
        );
}
