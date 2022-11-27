import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application_name/data/data.dart';
import 'package:my_application_name/models/agnostic_file.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository deviceRepository;

  DeviceBloc({
    required this.deviceRepository,
  }) : super(DeviceInitial()) {
    on<PickFileEvent>(
      (event, emit) async {
        final result = await deviceRepository.pickFile();

        emit(
          result.fold(
            (l) => PickFileFailure(),
            (r) => PickFileSuccess(file: r),
          ),
        );
      },
    );

    on<PickImageEvent>(
      (event, emit) async {
        final result = await deviceRepository.pickMedia(
          isVideo: false,
          useCamera: event.useCamera,
        );

        emit(
          result.fold(
            (l) => PickImageFailure(),
            (r) => PickImageSuccess(file: r),
          ),
        );
      },
    );

    on<PickVideoEvent>(
      (event, emit) async {
        final result = await deviceRepository.pickMedia(
          isVideo: true,
          useCamera: event.useCamera,
        );

        emit(
          result.fold(
            (l) => PickVideoFailure(),
            (r) => PickVideoSuccess(file: r),
          ),
        );
      },
    );

    on<OpenWebpageEvent>(
      (event, emit) async {
        final result = await deviceRepository.openWebpage(
          url: event.url,
        );

        emit(
          result.fold(
            (l) => OpenWebpageFailure(),
            (r) => OpenWebpageSuccess(),
          ),
        );
      },
    );
  }
}
