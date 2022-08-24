import 'dart:io';
import 'package:mason/mason.dart';

const _kFileNamesPresentInBlackList = ['.DS_Store'];

void run(HookContext context) {
  _formatFiles(context);
}

void _formatFiles(final HookContext context) {
  final logger = context.logger;
  final directory = Directory('.');

  final files = directory.listSync(recursive: true);

  for (final file in files) {
    file as File;

    final fileName = file.path.split(Platform.pathSeparator).last;

    if (_kFileNamesPresentInBlackList.contains(fileName)) {
      file.deleteSync();
    } else {
      final lines = file.readAsLinesSync();
      final formattedLines = <String>[];

      String previousLine = '';

      for (final currentLine in lines) {
        if (!(previousLine == '\n' && currentLine == previousLine)) {
          formattedLines.add(currentLine);
        }

        previousLine = currentLine;
      }

      if (lines.length != formattedLines.length) {
        file.writeAsStringSync(formattedLines.join());
      }
    }
  }
}
