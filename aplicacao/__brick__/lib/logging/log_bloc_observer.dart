import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumberdash/lumberdash.dart';

class LogBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    logMessage('Event $event was dispatched to $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    logWarning('Error $error was thrown within $bloc!');
    logError('Stacktrace: \n$stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    logMessage(
      '''Bloc $bloc is transitioning from ${transition.currentState} to ${transition.nextState} due to ${transition.event} dispatch.''',
    );
  }
}
