import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/app_starter.dart' as starter;

abstract class LocalizationProvider {
  AppLocalizations get localization;
}

class LocalizationProviderImpl implements LocalizationProvider {
  @override
  AppLocalizations get localization => starter.localizations;
}
