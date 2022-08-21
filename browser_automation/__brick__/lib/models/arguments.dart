import 'package:args/args.dart';
import 'arg_parser.dart';

class Arguments {
  {{#includeOutputMode}}
  final OutputMode outputMode;
  {{/includeOutputMode}}

  final bool headless;

  const Arguments({
    {{#includeOutputMode}}
    this.outputMode = OutputMode.todo,
    {{/includeOutputMode}}
    this.headless = true,
  });

  static Arguments? fromArgs(
    final List<String> args,
    final ArgParser parser,
  ) {
    try {
      if (args.where((x) => x.startsWith('-')).isEmpty && args.length >= 0) {
        return const Arguments();
      } else {
        final parseResults = parser.parse(args);

        return Arguments(
          {{#includeOutputMode}}
          outputMode: parseResults.outputMode ?? OutputMode.todo,
          {{/includeOutputMode}}
          headless: parseResults.headless,
        );
      }
    } on Object catch (_) {
      return null;
    }
  }
}

{{#includeOutputMode}}
enum OutputMode {
  todo,
  add,
  possible,
  output,
  modes;

  static OutputMode? fromArgument(final String? value) {
    final lowerValue = value?.toLowerCase();

    final possibleValues = OutputMode.values.where((v) => v.name == lowerValue);

    if (possibleValues.isNotEmpty) {
      return possibleValues.first;
    } else {
      return null;
    }
  }
}
{{/includeOutputMode}}
