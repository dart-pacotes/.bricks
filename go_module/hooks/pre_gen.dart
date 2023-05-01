import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _setFileEntitiesPathBeforeGen(context);
  _setLicenseDetails(context);

  final logger = context.logger;

  final isOpenSource = context.vars['openSource'] == true;

  var repositoryUrl = '';

  if (isOpenSource) {
    repositoryUrl = logger.prompt('${lightGreen.wrap('?')} Repository URL?');
  }

  context.vars = {
    ...context.vars,
    'repositoryUrl': repositoryUrl,
  };
}

void _setFileEntitiesPathBeforeGen(HookContext context) {
  final paths = Directory.current.listSync(recursive: true).map((e) => e.path);

  context.vars = {
    ...context.vars,
    'fileEntitiesPathBeforeGen': [...paths],
  };
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
