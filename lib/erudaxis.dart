import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'core/constants/constant.dart';
import 'core/themes/app_theme.dart';
import 'generated/l10n.dart';
import 'presentation/splash_screen_view.dart';
import 'presentation/utils/spin_loading.dart';

class Erudaxis extends StatelessWidget {
  const Erudaxis({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: LanguageViewModel.new,
      child: Consumer<LanguageViewModel>(
        builder: (context, viewModel, child) => GlobalLoaderOverlay(
          closeOnBackButton: true,
          useBackButtonInterceptor: true,
          overlayWidgetBuilder: (progress) => const SpinLoading(),
          overlayColor: Colors.black.withOpacity(0.5),
          child: MaterialApp(
            navigatorKey: mainnavigatorKey,
            debugShowCheckedModeBanner: false,
            locale: viewModel.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Erudaxis',
            theme: AppTheme.themeData,
            onGenerateTitle: (context) {
              intl = S.of(context);
              textTheme = Theme.of(context).textTheme;
              Dimensions.init(context);
              return intl.appName;
            },
            home: const SplashScreenView(),
          ),
        ),
      ),
    );
  }
}
