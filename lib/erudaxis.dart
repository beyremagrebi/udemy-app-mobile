import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/constant.dart';
import 'core/themes/app_theme.dart';
import 'generated/l10n.dart';
import 'presentation/auth/login_view.dart';

class Erudaxis extends StatelessWidget {
  const Erudaxis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainnavigatorKey,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      onGenerateTitle: (context) {
        intl = S.of(context);
        textTheme = Theme.of(context).textTheme;
        return intl.title;
      },
      home: const LoginView(),
    );
  }
}
