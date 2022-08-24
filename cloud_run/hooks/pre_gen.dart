import 'package:mason/mason.dart';

void run(HookContext context) {
  final isNodeEnvironment = context.vars['environment'] == 'node';

  var useFirebase = false;

  if (isNodeEnvironment) {
    useFirebase = context.logger.confirm(
      '${lightGreen.wrap('?')} Will you be using Firebase?',
      defaultValue: false,
    );
  }

  context.vars = {
    ...context.vars,
    'isNodeEnvironment': isNodeEnvironment,
    'useFirebase': useFirebase,
  };
}
