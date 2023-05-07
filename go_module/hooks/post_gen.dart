import 'dart:io';
import 'package:mason/mason.dart';


void run(HookContext context) {
  if (_isGoAvailable()) {
    _formatFiles(context);
    _cleanDependencies(context);
  }
}

bool _isGoAvailable() {
  final checkCommandAvailabilityStatus = Process.runSync(
    'go',
    ['version'],
    runInShell: true,
  );

  return (checkCommandAvailabilityStatus.stdout?.toString() ?? '').length > 0;
}

void _formatFiles(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  final progress = logger.progress('Formatting files');

  logger.info('Running gofmt');

  final goRunFormat = Process.runSync(
    'gofmt -s -w .\\',
    [],
    runInShell: true,
    workingDirectory: directory.path,
  );

  logger.info(goRunFormat.stdout);

  progress.complete('Finish formatting.');
}

void _cleanDependencies(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  final progress = logger.progress('Cleaning Dependencies');

  logger.info('Running go mod tidy');

  final goRunTidy = Process.runSync(
    'go mod tidy',
    [],
    runInShell: true,
    workingDirectory: directory.path,
  );

  logger.info(goRunTidy.stdout);

  progress.complete('Finish cleaning.');
}