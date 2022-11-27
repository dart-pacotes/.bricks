import 'dart:io';
import 'package:mason/mason.dart';

const _kFileNamesPresentInBlackList = ['.DS_Store'];
const _kFileExtensionsIgnoreList = ['.ttf', '.png'];

void run(HookContext context) {
  _formatFiles(context);
  _formatFlutterProject(context);
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
    if (file is File &&
        !pathsOfFileEntitiesToIgnore.contains(file.path) &&
        _kFileExtensionsIgnoreList
            .where((x) => file.path.endsWith(x))
            .isEmpty) {
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

void _formatFlutterProject(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  logger.info('Formatting Flutter project');

  Process.run(
    'flutter',
    ['format', directory.path],
  );
}
