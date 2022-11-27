import 'package:my_application_name/presentation/assets/assets.dart';
import 'package:my_application_name/presentation/theme/theme.dart';
import 'package:my_application_name/presentation/widgets/widgets.dart';

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
          myApplicationNameHighlight,
        ),
      ),
    );
  }
}

class MyApplicationNameLoadingIndicator extends StatelessWidget {
  const MyApplicationNameLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          myApplicationNameHighlight,
        ),
      ),
    );
  }
}
