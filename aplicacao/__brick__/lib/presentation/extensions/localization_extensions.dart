import 'package:my_application_name/presentation/l10n/l10n.dart';
import 'package:my_application_name/presentation/widgets/widgets.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations get strings {
    return AppLocalizations.of(this);
  }
}
