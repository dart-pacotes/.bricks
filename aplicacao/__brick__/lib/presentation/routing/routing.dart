import 'package:{{name.lowerCase().snakeCase()}}/presentation/views/views.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

const appStartupRoute = '/';
const homeRoute = '/home';

const initialRoute = appStartupRoute;

Future<void> navigateToHome(final BuildContext context) {
  return Navigator.of(context).pushReplacementNamed(
    homeRoute,
  );
}

Route onGenerateRoute(final RouteSettings settings) {
  late Widget Function(BuildContext) builder;

  switch (settings.name) {
    case appStartupRoute:
      builder = (_) => const AppStartupView();

      break;
    case homeRoute:
    default:
      builder = (_) => const HomeView();

      break;
  }

  return NoAnimationPageRoute(
    builder: builder,
    settings: settings,
  );
}

class NoAnimationPageRoute extends MaterialPageRoute {
  NoAnimationPageRoute({
    required super.builder,
    required super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
