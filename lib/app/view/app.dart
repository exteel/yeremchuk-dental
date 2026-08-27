import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/l10n/l10n.dart';
import 'package:yeremchuk_dental/router/app_router.dart';
import 'package:yeremchuk_dental/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
