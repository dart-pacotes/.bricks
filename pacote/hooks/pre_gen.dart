import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _setFileEntitiesPathBeforeGen(context);
}

void _setFileEntitiesPathBeforeGen(HookContext context) {
  final paths = Directory.current.listSync(recursive: true).map((e) => e.path);

  context.vars = {
    ...context.vars,
    'fileEntitiesPathBeforeGen': [...paths],
  };
}
