import 'package:my_application_name/blocs/blocs.dart';
import 'package:my_application_name/presentation/assets/assets.dart';
import 'package:my_application_name/presentation/widgets/widgets.dart';
import 'package:my_application_name/presentation/extensions/extensions.dart';

part 'home_open_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.homeTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            strings.greet('my_application_name'),
          ),
          const SizedBox.square(
            dimension: AppDimensions.thirtyTwoPoints,
          ),
          const HomeOpenButton(),
        ],
      ),
    );
  }
}
