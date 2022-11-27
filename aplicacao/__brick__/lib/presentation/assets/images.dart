import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

const String _kAppLogoAssetPath = 'assets/images/logo.png';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const {{name.pascalCase()}}Image.asset(
      assetPath: _kAppLogoAssetPath,
    );
  }
}
