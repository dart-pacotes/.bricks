// ignore_for_file: avoid_print

import 'dart:io';

// dart update_localizations.dart -c flutter
void main(List<String> args) {
  final margs = <String, String>{};

  for (var i = 0; i < args.length - 1; i++) {
    if (args[i].startsWith('-')) {
      margs[args[i]] = args[i + 1];
    }
  }

  final flutterCommand = margs['-c'] ?? 'flutter';

  final localizationFiles = File('.')
      .parent
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('localizations.dart'))
      .where((f) => !f.path.contains('scripts/update_localizations.dart'));

  print(localizationFiles);

  localizationFiles
      .map(
        (f) => Process.runSync(
          flutterCommand,
          [
            'pub',
            'run',
            'intl_generator:extract_to_arb',
            '--output-dir=${f.parent.absolute.path}/messages',
            f.absolute.path,
          ],
          workingDirectory: f.parent.absolute.path,
        ),
      )
      .forEach((x) => print(x.stderr == '' ? x.stdout : x.stderr));

  localizationFiles
      .map(
        (f) => Process.runSync(
          flutterCommand,
          [
            'pub',
            'run',
            'intl_generator:generate_from_arb',
            '--output-dir=${f.parent.absolute.path}/messages',
            '--no-use-deferred-loading',
            f.absolute.path,
            ...Directory('${f.parent.absolute.path}/messages')
                .listSync()
                .where((f) =>
                    f.path.contains(RegExp(r'intl_(.+)\.arb', dotAll: true)))
                .map((f) => f.absolute.path)
          ],
          workingDirectory: '${f.parent.absolute.path}/',
        ),
      )
      .forEach((x) => print(x.stderr == '' ? x.stdout : x.stderr));
}
