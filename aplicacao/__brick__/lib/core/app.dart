import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:funky_backgrounds/funky_backgrounds.dart';
import 'package:{{name.lowerCase().snakeCase()}}/blocs/blocs.dart';
import 'package:{{name.lowerCase().snakeCase()}}/core/core.dart';
import 'package:{{name.lowerCase().snakeCase()}}/data/data.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/presentation.dart';

class {{name.pascalCase()}}App extends StatelessWidget {
  final Vault vault;

  const {{name.pascalCase()}}App({
    Key? key,
    required this.vault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return RepositoryProvider<Vault>(
      create: (context) => vault,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  vault.lookup<AuthenticationRepository>(),
            ),
          ),
          BlocProvider<AppBloc>(
            create: (context) => AppBloc()..add(AppStartEvent()),
          ),
          BlocProvider<DeviceBloc>(
            create: (context) => DeviceBloc(
              deviceRepository: vault.lookup<DeviceRepository>(),
            ),
          ),
        ],
        child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {
            if (state is AppStartSuccess) {
              navigateToHome(navigatorKey.currentContext!);
            }
          },
          builder: (_, state) {
            return MaterialApp(
              title: '{{name.lowerCase()}}',
              theme: {{name.lowerCase().camelCase()}}LightTheme,
              themeMode: ThemeMode.light,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              {{#useResponsiveFramework}}
              builder: (context, child) => ResponsiveWrapper.builder(
                FunkyBackground(
                  painter: FunkyBezierLines(
                    context.colorScheme.primary,
                  ),
                  child: child,
                ),
                minWidth: AppDimensions.minWidth,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(
                    AppDimensions.mobileResizeBreakpoint,
                    name: MOBILE,
                  ),
                  ResponsiveBreakpoint.autoScale(
                    AppDimensions.tabletScaleBreakpoint,
                    name: TABLET,
                  ),
                  ResponsiveBreakpoint.resize(
                    AppDimensions.desktopResizeBreakpoint,
                    name: DESKTOP,
                  ),
                ],
              ),
              {{/useResponsiveFramework}}
              {{^useResponsiveFramework}}
              builder: (context, child) {
                return FunkyBackground(
                  painter: FunkyBezierLines(
                    context.colorScheme.primary,
                  ),
                  child: child,
              );
              },
              {{/useResponsiveFramework}}
              initialRoute: initialRoute,
              onGenerateRoute: onGenerateRoute,
              navigatorKey: navigatorKey,
            );
          },
        ),
      ),
    );
  }
}
