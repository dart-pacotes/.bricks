import 'package:{{name.lowerCase().snakeCase()}}/presentation/assets/assets.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

class AppStartupView extends StatelessWidget {
  const AppStartupView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppLogo(),
    );
  }
}
