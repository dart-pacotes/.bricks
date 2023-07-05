import 'package:mason/mason.dart';

void run(HookContext context) {
  _setAdapterSelectors(context);
  _setKeywordsList(context);
}

void _setAdapterSelectors(HookContext context) {
  final hasSelectedGitHubPagesAdapter =
      context.vars['adapter'] == 'github-pages';

  context.vars = {
    ...context.vars,
    'useGitHubPagesAdapter': hasSelectedGitHubPagesAdapter,
    'useNodeAdapter': !hasSelectedGitHubPagesAdapter,
  };
}

void _setKeywordsList(HookContext context) {
  final keywordsCommaSeparated = context.vars['keywords'];

  final keywords = [
    ...keywordsCommaSeparated.split(',').map((x) => x.trim()),
  ];

  context.vars = {
    ...context.vars,
    'keywords': keywords,
  };
}
