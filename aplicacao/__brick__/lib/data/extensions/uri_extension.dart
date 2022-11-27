extension UriExtension on Uri {
  String get storageKey => pathSegments.last.replaceAll('/', '');
}
