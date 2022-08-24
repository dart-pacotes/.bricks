import 'package:mason/mason.dart';

void run(HookContext context) {
  final isNodeEnvironment = context.vars['environment'] == 'node';

  context.vars = {
    ...context.vars,
    'isNodeEnvironment': isNodeEnvironment,
  };
}
