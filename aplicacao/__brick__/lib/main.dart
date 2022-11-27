import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.lowerCase().snakeCase()}}/blocs/blocs.dart';
import 'package:{{name.lowerCase().snakeCase()}}/logging/logging.dart';
import 'package:{{name.lowerCase().snakeCase()}}/core/core.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      final lumberdashClients = <LumberdashClient>[
        ColorizeLumberdash(),
      ];

      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      const isReleaseMode = kReleaseMode;

      putLumberdashToWork(
        withClients: lumberdashClients,
      );

      final vault = await createVault(
        isReleaseMode: isReleaseMode,
      );

      runApp(
        {{name.pascalCase()}}App(
          vault: vault,
        ),
      );
    },
    blocObserver: LogBlocObserver(),
  );
}
