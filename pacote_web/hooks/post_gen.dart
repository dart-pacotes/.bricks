import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  if (_isNPMAvailable()) {
    _installDependencies(context);
    _formatFiles(context);
  }
}

bool _isNPMAvailable() {
  final checkCommandAvailabilityStatus = Process.runSync(
    'command',
    ['-v', 'npm'],
    runInShell: true,
  );

  return (checkCommandAvailabilityStatus.stdout?.toString() ?? '').length > 0;
}

void _installDependencies(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  final progress = logger.progress('Installing dependencies');

  logger.info('Running npm install');

  final npmInstallStatus = Process.runSync(
    'npm',
    ['i'],
    runInShell: true,
    workingDirectory: directory.path,
  );

  logger.info(npmInstallStatus.stdout);

  progress.complete('Finish formatting.');
}

void _formatFiles(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;

  final progress = logger.progress('Formatting files');

  logger.info('Running npm run format');

  final npmRunFormatStatus = Process.runSync(
    'npm',
    ['run', 'format'],
    runInShell: true,
    workingDirectory: directory.path,
  );

  logger.info(npmRunFormatStatus.stdout);

  progress.complete('Finish formatting.');
}
