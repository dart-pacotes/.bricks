import 'package:{{name.lowerCase().snakeCase()}}/presentation/l10n/l10n.dart';
import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations get strings {
    return AppLocalizations.of(this);
  }
}
