import 'package:{{name.lowerCase().snakeCase()}}/models/models.dart';

typedef MediaConstructor = Media Function({
  required String url,
  AgnosticFile? cacheFile,
});

abstract class Media {
  final String url;

  final AgnosticFile? cacheFile;

  const Media({
    required this.url,
    this.cacheFile,
  });

  bool get isCached => cacheFile != null;

  static Media fromUrl(final String url) {
    final extension = url.split('?').first.split('.').last;
    final media = kAllowedFileExtensionsByMedia[extension] ?? ImageMedia.new;

    return media.call(
      url: url,
    );
  }

  Media copyWith({
    final AgnosticFile? cacheFile,
  }) {
    late MediaConstructor constructor;

    switch (runtimeType) {
      case VideoMedia:
        constructor = VideoMedia.new;
        break;
      case AudioMedia:
        constructor = AudioMedia.new;
        break;
      case ImageMedia:
      default:
        constructor = ImageMedia.new;
    }

    return constructor.call(
      url: url,
      cacheFile: cacheFile ?? this.cacheFile,
    );
  }
}

class ImageMedia extends Media {
  const ImageMedia({
    required super.url,
    super.cacheFile,
  });
}

class VideoMedia extends Media {
  const VideoMedia({
    required super.url,
    super.cacheFile,
  });
}

class AudioMedia extends Media {
  const AudioMedia({
    required super.url,
    super.cacheFile,
  });
}
