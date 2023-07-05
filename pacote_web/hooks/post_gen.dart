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
  final exampleDirectory = Directory('${directory.path}/example');

  final progress = logger.progress('Installing dependencies');

  final runningOnWindows = Platform.isWindows;

  logger.info('Running npm install');

  void npmInstall(
    Directory directory, {
    bool exampleDir = false,
  }) {
    if (runningOnWindows && exampleDir) {
      logger.warn(
        '''
WARNING: Looks like you\'re developing under a Windows environment. If you ever need to install 
dependencies on the example project, make sure you pass the "--no-delete-symlinks" flag! ''',
      );
    }

    final npmInstallStatus = Process.runSync(
      'npm',
      ['i', if (runningOnWindows && exampleDir) '--no-delete-symlinks'],
      runInShell: true,
      workingDirectory: directory.path,
    );

    logger.info(npmInstallStatus.stdout);
  }

  npmInstall(directory);

  if (exampleDirectory.existsSync()) {
    npmInstall(exampleDirectory, exampleDir: true);
  }

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
