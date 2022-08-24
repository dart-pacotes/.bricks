import 'package:mason/mason.dart';
import 'dart:io';

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
    'fileEntitiesPathBeforeGen': [
      ..._fileEntitiesPathBeforeGen(),
    ],
  };
}

Iterable<String> _fileEntitiesPathBeforeGen() {
  return Directory.current.listSync(recursive: true).map((e) => e.path);
}
