import 'dart:io';
import 'package:mason/mason.dart';

const _kFileNamesPresentInBlackList = ['.DS_Store'];

void run(HookContext context) {
  _formatFiles(context);
}

void _formatFiles(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  final pathsOfFileEntitiesToIgnore =
      context.vars['fileEntitiesPathBeforeGen'] as List;

  final files = directory.listSync(recursive: true);

  final progress = logger.progress('Formatting files');

  final formattedFiles = <File>[];

  for (final file in files) {
    if (file is File && !pathsOfFileEntitiesToIgnore.contains(file.path)) {
      final fileName = file.path.split(Platform.pathSeparator).last;

      if (_kFileNamesPresentInBlackList.contains(fileName)) {
        file.deleteSync();
      } else {
        final content = file.readAsStringSync();

        final formattedContent = content.trim();

        if (content.length != formattedContent.length) {
          file.writeAsStringSync(formattedContent);

          formattedFiles.add(file);
        }
      }
    }
  }

  if (formattedFiles.isNotEmpty) {
    progress.complete('Formatted ${formattedFiles.length} file(s):');

    formattedFiles.forEach(
      (file) {
        logger.info(
          '  ${darkGray.wrap(file.absolute.path)} ${lightGreen.wrap('(formatted)')}',
        );
      },
    );
  } else {
    progress.complete('No files needed to format.');
  }
}
