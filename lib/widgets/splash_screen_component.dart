import 'dart:ui';

import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../presentation/utils/partical_painter.dart';
import '../providers/main/profile/theme/theme_view_model.dart';
import '../providers/splash_screen_view_model.dart';

class SplashComponents {
  static const Color textWhite = Colors.white;

  static Widget buildAnimatedLogo(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return Transform.scale(
      scale: viewModel.logoScale?.value ?? 0.0,
      child: Opacity(
        opacity: viewModel.logoOpacity?.value ?? 0.0,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                textWhite.withOpacity(0.2),
                textWhite.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: textWhite.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: themeViewModel.currentTheme.primary.withOpacity(0.3),
                blurRadius: 20,
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const Center(
                child: AssetsImageWidget(
              imageFileName: Assets.logo,
              height: 60,
              width: 60,
            )),
          ),
        ),
      ),
    );
  }

  static Widget buildAnimatedText(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return SlideTransition(
      position:
          viewModel.textSlide ?? const AlwaysStoppedAnimation(Offset.zero),
      child: FadeTransition(
        opacity: viewModel.textOpacity ?? const AlwaysStoppedAnimation(0),
        child: Column(
          children: [
            Text(
              intl.appName,
              style: GoogleFonts.leagueSpartan(
                color: textWhite,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: themeViewModel.currentTheme.primary.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            Dimensions.heightSmall,
            Text(
              intl.studyCompanion,
              style: TextStyle(
                color: textWhite.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildBackground(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1E1B4B).withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            themeViewModel.currentTheme.primary.withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            themeViewModel.currentTheme.secondary.withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            themeViewModel.currentTheme.primary.withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 0.3, 0.7, 1.0],
        ),
      ),
    );
  }

  static Widget buildBackgroundEffects(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    return Positioned.fill(
      child: CustomPaint(
        painter: ParticlesPainter(
          animation:
              viewModel.backgroundOpacity ?? const AlwaysStoppedAnimation(0),
          color: textWhite.withOpacity(0.1),
        ),
      ),
    );
  }

  static Widget buildLoadingIndicator(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    return Padding(
      padding: Dimensions.verticalPaddingExtraLarge,
      child: FadeTransition(
        opacity: viewModel.loadingOpacity ?? const AlwaysStoppedAnimation(0),
        child: Column(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: const AlwaysStoppedAnimation<Color>(textWhite),
                backgroundColor: textWhite.withOpacity(0.2),
              ),
            ),
            Dimensions.heightLarge,
            Text(
              intl.loading,
              style: TextStyle(
                color: textWhite.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
