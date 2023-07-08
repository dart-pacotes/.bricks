import 'package:mason/mason.dart';

void run(HookContext context) {
  _setLicenseDetails(context);
  _setIsLibraryCheck(context);
  _setWithHotReloadCheck(context);
  _setKeywordsList(context);
  _promptBinUsage(context);
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

void _setKeywordsList(HookContext context) {
  final keywordsCommaSeparated = context.vars['keywords'];

  final keywords = [
    ...keywordsCommaSeparated.split(',').map((x) => x.trim()),
  ];

  context.vars = {
    ...context.vars,
    'keywords': keywords,
  };
}

void _promptBinUsage(HookContext context) {
  final isLibrary = context.vars['isLibrary'] as bool;

  bool generateBin = false;

  if (isLibrary) {
    generateBin = context.logger.confirm(
      'Would like to generate a bin program (e.g., usage with npx) for this package?',
      defaultValue: true,
    );
  }

  context.vars = {
    ...context.vars,
    'generateBin': generateBin,
  };
}
