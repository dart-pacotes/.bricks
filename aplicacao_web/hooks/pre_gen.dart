import 'package:mason/mason.dart';

void run(HookContext context) {
  _setAdapterSelectors(context);
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
