import 'package:args/args.dart';
import 'package:{{name.lowerCase().snakeCase()}}/{{name.lowerCase().snakeCase()}}.dart';

{{#includeOutputMode}}
const _kOutputModeArgumentName = 'mode';
const _kOutputModeArgumentAbbreviation = 'm';
const _kOutputModeArgumentHelp =
    'Specifies the output mode (todo, add, possible, output, modes).';
{{/includeOutputMode}}

const _kHeadfulArgumentName = 'headful';
const _kHeadfulArgumentAbbreviation = 'h';
const _kHeadfulArgumentNameHelp =
    'Specifies whether the automation should run in headful or headless mode. (defaults to headless)';

ArgParser programArgParser() {
  final parser = ArgParser();

  {{#includeOutputMode}}
  parser.addOption(
    _kOutputModeArgumentName,
    abbr: _kOutputModeArgumentAbbreviation,
    help: _kOutputModeArgumentHelp,
    defaultsTo: OutputMode.todo.name,
    mandatory: false,
  );
  {{/includeOutputMode}}

  parser.addFlag(
    _kHeadfulArgumentName,
    abbr: _kHeadfulArgumentAbbreviation,
    help: _kHeadfulArgumentNameHelp,
    defaultsTo: false,
  );

  return parser;
}

extension ArgResultsExtension on ArgResults {

  {{#includeOutputMode}}
  OutputMode? get outputMode =>
      OutputMode.fromArgument(this[_kOutputModeArgumentName]);
  {{/includeOutputMode}}

  bool get headless => !this[_kHeadfulArgumentName];
}
