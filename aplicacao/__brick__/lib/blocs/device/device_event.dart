part of 'device_bloc.dart';

abstract class DeviceEvent {
  const DeviceEvent();
}

class PickFileEvent extends DeviceEvent {}

class PickMediaEvent extends DeviceEvent {
  final bool useCamera;

  const PickMediaEvent({
    required this.useCamera,
  });
}

class PickImageEvent extends PickMediaEvent {
  const PickImageEvent({
    required super.useCamera,
  });
}

class PickVideoEvent extends PickMediaEvent {
  const PickVideoEvent({
    required super.useCamera,
  });
}

class OpenWebpageEvent extends DeviceEvent {
  final String url;

  const OpenWebpageEvent({
    required this.url,
  });
}
