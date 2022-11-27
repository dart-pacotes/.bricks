// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dartz/dartz.dart' hide OpenFile;
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_application_name/core/core.dart';
import 'package:my_application_name/data/data.dart';
import 'package:my_application_name/logging/logging.dart';
import 'package:my_application_name/models/models.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_compress/video_compress.dart';

typedef LaunchBrowserWithUrlCallback = Future<void> Function({
  required String url,
});

abstract class DeviceRepository {
  Future<Either<RequestError, bool>> share({
    required final ShareableContent shareable,
  });

  Future<Either<RequestError, AgnosticFile>> pickFile({
    FileType type = FileType.any,
    bool allowMultiple = false,
  });

  Future<Either<RequestError, AgnosticFile>> pickMedia({
    required bool isVideo,
    required bool useCamera,
  });

  Future<Either<RequestError, void>> openFile({
    required AgnosticFile file,
  });

  Future<Either<RequestError, AgnosticFile>> compressFile({
    required AgnosticFile file,
    final bool deleteOrigin = false,
  });

  Future<Either<RequestError, void>> openWebpage({
    required String url,
  });
}

class LiveDeviceRepository implements DeviceRepository {
  final ImagePicker imagePicker;

  final FilePicker filePicker;

  final IVideoCompress videoCompressor;

  final PathProviderPlatform pathProvider;

  final LaunchBrowserWithUrlCallback launchBrowserWithUrlCallback;

  Future<String> get directoryPath {
    final path = Platform.isIOS
        ? pathProvider.getTemporaryPath()
        : pathProvider.getApplicationDocumentsPath();

    return path.then((value) => value!);
  }

  Future<String> filePath(final String key) =>
      directoryPath.then((value) => '$value/$key');

  const LiveDeviceRepository({
    required this.imagePicker,
    required this.filePicker,
    required this.videoCompressor,
    required this.pathProvider,
    required this.launchBrowserWithUrlCallback,
  });

  @override
  Future<Either<RequestError, bool>> share({
    required final ShareableContent shareable,
  }) {
    return safeAsyncThrowCall(
      () async {
        final result = await Share.shareWithResult(
          shareable.shareText,
          subject: shareable.title,
        );

        return Future.value(
          Right(
            result.status == ShareResultStatus.success,
          ),
        );
      },
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> pickFile({
    FileType type = FileType.any,
    bool allowMultiple = false,
  }) {
    return safeAsyncThrowCall(
      () async {
        final result = await filePicker.pickFiles(
          allowMultiple: allowMultiple,
          type: type,
        );

        if (result == null || result.files.isEmpty) {
          return Left(
            ReadDeviceError(
              stacktrace: StackTrace.current,
            ),
          );
        } else {
          final file = result.files.first;

          return Right(
            AgnosticFile(
              path: file.path!,
              bytes: file.bytes,
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> pickMedia({
    required bool isVideo,
    required bool useCamera,
  }) {
    return safeAsyncThrowCall(
      () async {
        XFile? result;

        final imageSource =
            useCamera ? ImageSource.camera : ImageSource.gallery;

        final pickCall =
            isVideo ? imagePicker.pickVideo : imagePicker.pickImage;

        result = await pickCall(source: imageSource);

        if (result == null) {
          return Left(
            ReadDeviceError(
              stacktrace: StackTrace.current,
            ),
          );
        } else {
          final file = result;

          return Right(
            AgnosticFile(
              path: file.path,
              bytes: await file.readAsBytes(),
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<RequestError, void>> openFile({
    required AgnosticFile file,
  }) {
    return safeAsyncThrowCall(
      () async {
        final result = await OpenFile.open(file.path);

        if (result.type == ResultType.done) {
          return const Right(null);
        } else {
          return Left(
            ReadDeviceError(
              cause: result.message,
              stacktrace: StackTrace.current,
            ),
          );
        }
      },
      onError: (error, stackTrace) => ReadDeviceError(stacktrace: stackTrace),
    );
  }

  @override
  Future<Either<RequestError, AgnosticFile>> compressFile({
    required AgnosticFile file,
    final bool deleteOrigin = false,
  }) {
    return safeAsyncThrowCall(
      () async {
        if (file.isVideo) {
          final path = file.path;

          final compressionInfo = await videoCompressor.compressVideo(
            path,
            deleteOrigin: deleteOrigin,
            includeAudio: true,
            quality: VideoQuality.MediumQuality,
          );

          if (compressionInfo != null) {
            return Right(
              AgnosticFile(
                path: compressionInfo.path!,
              ),
            );
          } else {
            return Left(
              WriteDeviceError(
                cause: 'Could not compress video',
                stacktrace: StackTrace.current,
              ),
            );
          }
        } else if (file.isImage) {
          final path = file.path;

          late File? compressedFile;

          final String compressedFilePath = await filePath(
            '${file.name}${file.fileExtension}',
          );

          try {
            compressedFile = await _compressImageFile(
              path: path,
              compressedFilePath: '$compressedFilePath.webp',
              format: CompressFormat.webp,
            );
          } on UnsupportedError catch (error, stacktrace) {
            logError(error, stacktrace: stacktrace);

            compressedFile = await _compressImageFile(
              path: path,
              compressedFilePath: '$compressedFilePath.jpg',
              format: CompressFormat.jpeg,
            );
          }

          if (compressedFile != null) {
            return Right(
              AgnosticFile(
                path: compressedFile.path,
              ),
            );
          } else {
            return Left(
              WriteDeviceError(
                cause: 'Could not compress image',
                stacktrace: StackTrace.current,
              ),
            );
          }
        } else {
          return Right(file);
        }
      },
    );
  }

  @override
  Future<Either<RequestError, void>> openWebpage({
    required String url,
  }) {
    return safeAsyncThrowCall(
      () async {
        await launchBrowserWithUrlCallback(url: url);

        return const Right(null);
      },
    );
  }

  Future<File?> _compressImageFile({
    required final String path,
    required final String compressedFilePath,
    required final CompressFormat format,
  }) {
    return FlutterImageCompress.compressAndGetFile(
      path,
      compressedFilePath,
      keepExif: false,
      format: format,
      quality: 60,
    );
  }
}
