import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _setLicenseDetails(context);
  _setModulePath(context);
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
