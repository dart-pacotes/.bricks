import 'package:my_application_name/presentation/widgets/widgets.dart';

const String _kAppLogoAssetPath = 'assets/images/logo.png';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApplicationNameImage.asset(
      assetPath: _kAppLogoAssetPath,
    );
  }
}
