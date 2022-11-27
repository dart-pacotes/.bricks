// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:{{name.lowerCase().snakeCase()}}/core/core.dart';
import 'package:{{name.lowerCase().snakeCase()}}/data/data.dart';
import 'package:{{name.lowerCase().snakeCase()}}/models/models.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

abstract class FileStorage implements Storage<Uint8List, AgnosticFile> {
  Future<Either<RequestError, AgnosticFile>> download({
    required final String url,
  });

  Future<Either<RequestError, List<AgnosticFile>>> list({
    required final bool Function(String path) accept,
  });
}

class PathProviderFileStorage implements FileStorage {
  final PathProviderPlatform pathProvider;

  final Client httpClient;

  const PathProviderFileStorage({
    required this.pathProvider,
    required this.httpClient,
  });

  Future<String> get directoryPath {
    final path = Platform.isIOS
        ? pathProvider.getTemporaryPath()
        : pathProvider.getApplicationDocumentsPath();

    return path.then((value) => value!);
  }

  Future<String> filePath(final String key) =>
      directoryPath.then((value) => '$value/$key');

  @override
  Future<Either<RequestError, void>> evict({
    required String key,
  }) {
    return safeAsyncThrowCall(
      () async {
        final path = await filePath(key);

        final file = File(path);

        file.deleteSync();

        return const Right(null);
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> lookup({
    required String key,
    final bool lazyLoad = false,
  }) {
    return safeAsyncThrowCall(
      () async {
        final path = await filePath(key);

        final file = File(path);

        Uint8List? data;

        if (!lazyLoad) {
          data = file.readAsBytesSync();
        }

        return Right(
          AgnosticFile(path: path, bytes: data),
        );
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> store({
    required String key,
    required Uint8List data,
  }) {
    return safeAsyncThrowCall(
      () async {
        final path = await filePath(key);

        final file = File(path);

        file.writeAsBytesSync(data);

        return Right(
          AgnosticFile(path: path, bytes: data),
        );
      },
      onError: (error, stackTrace) => WriteDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> download({
    required String url,
  }) {
    return safeAsyncThrowCall(
      () async {
        final uri = Uri.parse(url);

        final request = await httpClient.get(uri);

        final data = request.bodyBytes;

        final key = uri.storageKey;

        return store(key: key, data: data);
      },
      onError: (error, stackTrace) => WriteDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, bool>> exists({
    required String key,
  }) {
    return safeAsyncThrowCall(
      () async {
        final path = await filePath(key);

        final file = File(path);

        return Right(
          file.existsSync(),
        );
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }

  @override
  Future<Either<RequestError, List<AgnosticFile>>> list({
    required bool Function(String path) accept,
  }) {
    return safeAsyncThrowCall(
      () async {
        final path = await directoryPath;

        final directory = Directory(path);

        final files = [
          ...directory.listSync().whereType<File>().where((f) => accept(f.path))
        ];

        return Right(
          [
            ...files.map(
              (f) => AgnosticFile(
                path: f.path,
                bytes: f.readAsBytesSync(),
              ),
            ),
          ],
        );
      },
      onError: (error, stackTrace) => ReadDeviceError(
        stacktrace: stackTrace,
      ),
    );
  }
}
