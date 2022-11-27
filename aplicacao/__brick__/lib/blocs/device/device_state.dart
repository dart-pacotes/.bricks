part of 'device_bloc.dart';

abstract class DeviceState {
  const DeviceState();
}

class DeviceInitial extends DeviceState {}

class PickFileSuccess extends DeviceState {
  final AgnosticFile file;

  const PickFileSuccess({
    required this.file,
  });
}

class PickFileFailure extends DeviceState {}

abstract class PickMediaSuccess extends DeviceState {
  final AgnosticFile file;

  const PickMediaSuccess({
    required this.file,
  });
}

abstract class PickMediaFailure extends DeviceState {}

class PickImageSuccess extends PickMediaSuccess {
  const PickImageSuccess({
    required super.file,
  });
}

class PickImageFailure extends PickMediaFailure {}

class PickVideoSuccess extends PickMediaSuccess {
  const PickVideoSuccess({
    required super.file,
  });
}

class PickVideoFailure extends PickMediaFailure {}

class OpenWebpageSuccess extends DeviceState {}

class OpenWebpageFailure extends DeviceState {}
