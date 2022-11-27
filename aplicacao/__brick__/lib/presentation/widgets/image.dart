// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:{{name.lowerCase().snakeCase()}}/models/models.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

class {{name.pascalCase()}}Image extends StatelessWidget {
  final AgnosticFile? image;

  final String? imageUrl;

  final String? assetPath;

  const {{name.pascalCase()}}Image._({
    Key? key,
    this.image,
    this.imageUrl,
    this.assetPath,
  }) : super(key: key);

  const {{name.pascalCase()}}Image.network({
    Key? key,
    required String imageUrl,
  }) : this._(key: key, imageUrl: imageUrl);

  const {{name.pascalCase()}}Image.memory({
    Key? key,
    required AgnosticFile image,
  }) : this._(key: key, image: image);

  const {{name.pascalCase()}}Image.asset({
    Key? key,
    required String assetPath,
  }) : this._(key: key, assetPath: assetPath);

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Image(
        image: {{name.pascalCase()}}CacheImageProvider(
          bytes: image!.bytes,
          uniqueKey: image!.name,
        ),
      );
    } else if (imageUrl != null) {
      return Image.network(imageUrl!);
    } else {
      return Image.asset(assetPath!);
    }
  }
}

class {{name.pascalCase()}}CacheImageProvider extends MemoryImage {
  final String uniqueKey;

  const {{name.pascalCase()}}CacheImageProvider({
    required this.uniqueKey,
    required final Uint8List bytes,
  }) : super(bytes);

  @override
  Future<MemoryImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<{{name.pascalCase()}}CacheImageProvider>(this);
  }

  @override
  ImageStreamCompleter load(MemoryImage key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(null, decode),
      scale: key.scale,
      debugLabel: uniqueKey,
    );
  }

  @override
  ImageStreamCompleter loadBuffer(
    MemoryImage key,
    DecoderBufferCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(decode, null),
      scale: key.scale,
      debugLabel: uniqueKey,
    );
  }

  Future<Codec> _loadAsync(
    DecoderBufferCallback? decode,
    DecoderCallback? decodeDepreacted,
  ) async {
    if (decode != null) {
      final ImmutableBuffer buffer = await ImmutableBuffer.fromUint8List(bytes);
      return decode(buffer);
    }

    return decodeDepreacted!(bytes);
  }

  @override
  int get hashCode => uniqueKey.hashCode;

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  @override
  String toString() {
    return '{{name.pascalCase()}}Image($uniqueKey)';
  }
}
