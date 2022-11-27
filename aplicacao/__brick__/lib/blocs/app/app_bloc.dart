import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppStartEvent>(
      (event, emit) async {
        emit(
          AppStartInProgress(),
        );

        // todo: app app startup logic here

        await Future.delayed(
          const Duration(seconds: 1),
        );

        emit(
          AppStartSuccess(),
        );
      },
    );
  }
}
