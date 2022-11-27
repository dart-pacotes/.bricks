import 'package:my_application_name/models/models.dart';

class ShareableContent {
  final String title;

  final String content;

  final List<Media> mediaAttachements;

  String get shareText =>
      '$content${mediaAttachements.fold('', (p, c) => '$p\n\n${c.url}')}';

  const ShareableContent({
    required this.title,
    required this.content,
    required this.mediaAttachements,
  });
}
