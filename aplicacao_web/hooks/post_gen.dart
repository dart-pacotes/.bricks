import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  if (_isNPMAvailable()) {
    _installDependencies(context);
    _installHooks(context);
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
  final managerDirectory = Directory('${directory.path}/tools/manager');

  final progress = logger.progress('Installing dependencies');

  logger.info('Running npm install');

  void npmInstall(Directory directory) {
    final npmInstallStatus = Process.runSync(
      'npm',
      ['i'],
      runInShell: true,
      workingDirectory: directory.path,
    );

    logger.info(npmInstallStatus.stdout);
  }

  npmInstall(directory);

  if (exampleDirectory.existsSync()) {
    npmInstall(exampleDirectory);
  }

  if (managerDirectory.existsSync()) {
    npmInstall(managerDirectory);
  }

  progress.complete('Finish npm install.');
}

void _installHooks(final HookContext context) {
  final logger = context.logger;
  final directory = Directory.current;
  final gitDirectory = Directory('${directory.path}/.git');
  final hooksDirectory = Directory('${directory.path}/hooks');

  if (!gitDirectory.existsSync()) {
    logger.info(
        'Current directory is not a git repository, skipping hooks install...');

    return;
  }

  final hooksFiles = hooksDirectory.listSync().whereType<File>();

  final progress = logger.progress('Installing hooks');

  final runningOnWindows = Platform.isWindows;

  if (runningOnWindows) {
    logger.warn(
      'Windows environment detected. Hooks will only be installed if mason was invoked in git-bash.',
    );
  }

  logger.info('Setting executable permissions...');

  hooksFiles.forEach(
    (file) {
      progress.update('chmod +x ${file.path}');

      final chmodStatus = Process.runSync(
        'chmod',
        ['+x', file.path],
        runInShell: true,
        workingDirectory: hooksDirectory.path,
      );

      logger.info(chmodStatus.stdout);
    },
  );

  logger.info('Installing hooks...');

  progress.update('./INSTALL');

  final installStatus = Process.runSync(
    './INSTALL',
    [],
    runInShell: true,
    workingDirectory: hooksDirectory.path,
  );

  logger.info(installStatus.stdout);

  progress.complete('Finish hooks install.');
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
