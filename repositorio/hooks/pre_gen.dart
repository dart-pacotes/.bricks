import 'dart:io';
import 'package:mason/mason.dart';

const _kNoneImplementation = 'none';
const _kFirebaseImplementation = 'firebase';

const _kTemplateImplementationsMap = {
  'device': [_kNoneImplementation],
  'authentication': [_kNoneImplementation, _kFirebaseImplementation],
  'none': <String>[],
};

void run(HookContext context) {
  _setFileEntitiesPathBeforeGen(context);
  _askForNameIfNecessary(context);
  _askForImplementationIfNeccessary(context);
  _askForCoreCodeGenerationIfNeccessary(context);
  _injectCheckers(context);
}

void _setFileEntitiesPathBeforeGen(HookContext context) {
  final paths = Directory.current.listSync(recursive: true).map((e) => e.path);

  context.vars = {
    ...context.vars,
    'fileEntitiesPathBeforeGen': [...paths],
  };
}

void _askForNameIfNecessary(HookContext context) {
  final template = context.vars['template'] ?? 'none';

  var name = context.vars['name'];

  if (template == 'none') {
    final logger = context.logger;

    name = logger.prompt(
      '${lightGreen.wrap('?')} What is the name of the repository being generated?',
    );
  } else {
    name = template;
  }

  context.vars = {
    ...context.vars,
    'name': name,
  };
}

void _askForImplementationIfNeccessary(HookContext context) {
  var implementation = context.vars['implementation'];
  final template = context.vars['template'];
  final implementationsForTemplate =
      _kTemplateImplementationsMap[template] ?? [];

  if (implementation == null && implementationsForTemplate.isNotEmpty) {
    final logger = context.logger;

    implementation = logger.chooseOne(
      '${lightGreen.wrap('?')} Use known implementation of the repository?',
      choices: implementationsForTemplate,
      defaultValue: _kNoneImplementation,
    );

    context.vars = {
      ...context.vars,
      'implementation': implementation,
    };
  }
}

void _askForCoreCodeGenerationIfNeccessary(HookContext context) {
  final template = context.vars['template'];

  var generateCoreCode = false;

  if (template != null) {
    final logger = context.logger;

    generateCoreCode = logger.confirm(
      '${lightGreen.wrap('?')} Generate core code?',
      defaultValue: false,
    );
  }

  context.vars = {
    ...context.vars,
    'generateCoreCode': generateCoreCode,
  };
}

void _injectCheckers(HookContext context) {
  final implementation = context.vars['implementation'];
  final template = context.vars['template'];
  final language = context.vars['language'];

  final withDartLanguage = language == 'dart';

  final usingAuthenticationTemplate = template == 'authentication';
  final usingDeviceTemplate = template == 'device';
  final notUsingTemplate = template == 'none';

  final usingFirebaseImplementation =
      implementation == _kFirebaseImplementation;
  final notUsingKnownImplementation = template == _kNoneImplementation;

  context.vars = {
    ...context.vars,
    'withDartLanguage': withDartLanguage,
    'usingAuthenticationTemplate': usingAuthenticationTemplate,
    'usingDeviceTemplate': usingDeviceTemplate,
    'notUsingTemplate': notUsingTemplate,
    'usingFirebaseImplementation': usingFirebaseImplementation,
    'notUsingKnownImplementation': notUsingKnownImplementation,
  };
}
