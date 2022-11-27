import 'package:{{name.lowerCase().snakeCase()}}/presentation/assets/assets.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/theme/theme.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

///
/// Use when you need to show loading indicators inside [ElevatedButton]
///
class ElevatedButtonLoadingIndicator extends StatelessWidget {
  const ElevatedButtonLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppDimensions.twentyFourPoints,
      width: AppDimensions.twentyFourPoints,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          {{name.lowerCase().camelCase()}}Highlight,
        ),
      ),
    );
  }
}

class {{name.pascalCase()}}LoadingIndicator extends StatelessWidget {
  const {{name.pascalCase()}}LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          {{name.lowerCase().camelCase()}}Highlight,
        ),
      ),
    );
  }
}
