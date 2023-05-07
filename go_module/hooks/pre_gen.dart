import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _setLicenseDetails(context);
  _setModulePath(context);
  _setWithDependabotCheck(context);
  _setWithThrottlingCheck(context);
  _setWithCorsCheck(context);
  _setIsOpenSourceCheck(context);
  _setTypeDetails(context);
  _setName(context);
  _setAuthor(context);
  _setDescription(context);
}

void _setLicenseDetails(HookContext context) {
  final license = context.vars['license'];

  final underMIT = license == 'MIT';
  final underGNUGPLV3 = license == 'GNUGPLV3';
  final licenseYear = DateTime.now().year;

  context.vars = {
    ...context.vars,
    'underMIT': underMIT,
    'underGNUGPLV3': underGNUGPLV3,
    'licenseYear': licenseYear,
  };
}

void _setModulePath(HookContext context) {
  context.vars = {
    ...context.vars,
    'modulePath': context.vars['modulePath'],
  };
}

void _setWithDependabotCheck(HookContext context) {
  final useDependabot = context.vars['dependabot'];

  final withDependabot = useDependabot == true;

  context.vars = {
    ...context.vars,
    'withDependabot': withDependabot,
  };
}

void _setWithThrottlingCheck(HookContext context) {
  final type = context.vars['type'];
  final useThrottling = context.vars['throttling'];

  final isWebService = type == 'webService';
  final withThrottling = useThrottling == true;

  context.vars = {
    ...context.vars,
    'withThrottling': isWebService && withThrottling,
  };
}

void _setWithCorsCheck(HookContext context) {
  final type = context.vars['type'];
  final useCors = context.vars['cors'];

  final isWebService = type == 'webService';
  final withCors = useCors == true;

  context.vars = {
    ...context.vars,
    'withCors': isWebService && withCors,
  };
}

void _setIsOpenSourceCheck(HookContext context) {
  final isOpenSource = context.vars['openSource'] == true;

  context.vars = {
    ...context.vars,
    'isOpenSource': isOpenSource,
  };
}

void _setTypeDetails(HookContext context) {
  final type = context.vars['type'];

  final isLibrary = type == 'library';
  final isCli = type == 'cli';
  final isWebService = type == 'webService';

  context.vars = {
    ...context.vars,
    'isLibrary': isLibrary,
    'isCli': isCli,
    'isWebService': isWebService,
  };
}

void _setName(HookContext context) {
  context.vars = {
    ...context.vars,
    'name': context.vars['name'],
  };
}

void _setAuthor(HookContext context) {
  context.vars = {
    ...context.vars,
    'author': context.vars['author'],
  };
}

void _setDescription(HookContext context) {
  context.vars = {
    ...context.vars,
    'description': context.vars['description'],
  };
}
