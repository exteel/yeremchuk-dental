import 'package:flutter/widgets.dart';
import 'package:yeremchuk_dental/l10n/gen/app_localizations.dart';

export 'package:yeremchuk_dental/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
