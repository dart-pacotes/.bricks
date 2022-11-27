import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'media.dart';

const int kMaxImageFileSize = 10 * 1024 * 1024;
const int kMaxVideoFileSize = 80 * 1024 * 1024;

const kAllowedFileExtensionsByMedia = <String, MediaConstructor>{
  'jpg': ImageMedia.new,
  'png': ImageMedia.new,
  'mp4': VideoMedia.new,
  'mov': VideoMedia.new,
  'mkv': VideoMedia.new,
  'mp3': AudioMedia.new,
};

final kAllowedFileExtensions = kAllowedFileExtensionsByMedia.keys.toList();

class AgnosticFile {
  late Uint8List bytes = _readFile();

  final String path;

  AgnosticFile({
    required this.path,
    final Uint8List? bytes,
  }) {
    if (bytes != null) {
      this.bytes = bytes;
    }
  }

  String get name => basenameWithoutExtension(path);

  String get fileExtension => extension(path);

  int get size => bytes.lengthInBytes;

  bool get isVideo =>
      kAllowedFileExtensionsByMedia[fileExtension.replaceFirst('.', '')] ==
      VideoMedia.new;

  bool get isImage =>
      kAllowedFileExtensionsByMedia[fileExtension.replaceFirst('.', '')] ==
      ImageMedia.new;

  Uint8List _readFile() {
    return File.fromUri(Uri.parse(path)).readAsBytesSync();
  }
}
