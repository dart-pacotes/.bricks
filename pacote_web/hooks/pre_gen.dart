import 'package:mason/mason.dart';

void run(HookContext context) {
  _setLicenseDetails(context);
  _setIsLibraryCheck(context);
  _setWithHotReloadCheck(context);
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

void _setIsLibraryCheck(HookContext context) {
  final type = context.vars['type'];

  final isLibrary = type == 'library';

  context.vars = {
    ...context.vars,
    'isLibrary': isLibrary,
  };
}

void _setWithHotReloadCheck(HookContext context) {
  final useHotReload = context.vars['hotreload'];

  final withHotReload = useHotReload == true;

  context.vars = {
    ...context.vars,
    'withHotReload': withHotReload,
  };
}
