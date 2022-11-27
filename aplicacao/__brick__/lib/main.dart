import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application_name/blocs/blocs.dart';
import 'package:my_application_name/logging/logging.dart';
import 'package:my_application_name/core/core.dart';

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
        MyApplicationNameApp(
          vault: vault,
        ),
      );
    },
    blocObserver: LogBlocObserver(),
  );
}
