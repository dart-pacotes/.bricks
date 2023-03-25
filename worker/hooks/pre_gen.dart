import 'package:mason/mason.dart';

void run(HookContext context) {
  _setTypeSelector(context);
}

void _setTypeSelector(HookContext context) {
  final type = context.vars['type'];
  final isFetchWorker = type == 'fetch';

  context.vars = {
    ...context.vars,
    'isFetchWorker': isFetchWorker,
  };
}
