import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_application_name/blocs/blocs.dart';
import 'package:my_application_name/core/core.dart';
import 'package:my_application_name/data/data.dart';
import 'package:my_application_name/presentation/presentation.dart';

class MyApplicationNameApp extends StatelessWidget {
  final Vault vault;

  const MyApplicationNameApp({
    Key? key,
    required this.vault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            create: (context) => AppBloc(),
          ),
          BlocProvider<DeviceBloc>(
            create: (context) => DeviceBloc(
              deviceRepository: vault.lookup<DeviceRepository>(),
            ),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (_, state) {
            return MaterialApp(
              title: 'myApplicationName',
              theme: myApplicationNameLightTheme,
              themeMode: ThemeMode.light,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              builder: (context, child) => ResponsiveWrapper.builder(
                child,
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
                background: Container(color: context.colorScheme.background),
              ),
              initialRoute: initialRoute,
              onGenerateRoute: onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
