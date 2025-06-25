import 'dart:ui';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import '../presentation/utils/partical_painter.dart';
import '../providers/splash_screen_view_model.dart';

class SplashComponents {
  // Couleurs
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color secondaryPurple = Color(0xFF7C3AED);
  static const Color darkPurple = Color(0xFF5B21B6);
  static const Color textWhite = Colors.white;

  static Widget buildAnimatedLogo(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
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
                color: primaryPurple.withOpacity(0.3),
                blurRadius: 20,
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const Center(
              child: Icon(
                Icons.school,
                size: 60,
                color: textWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildAnimatedText(BuildContext context,
      {required SplashScreenViewModel viewModel}) {
    return SlideTransition(
      position:
          viewModel.textSlide ?? const AlwaysStoppedAnimation(Offset.zero),
      child: FadeTransition(
        opacity: viewModel.textOpacity ?? const AlwaysStoppedAnimation(0),
        child: Column(
          children: [
            Text(
              'Erudaxis',
              style: TextStyle(
                color: textWhite,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: darkPurple.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Votre compagnon d'études",
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1E1B4B).withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            primaryPurple.withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            secondaryPurple.withOpacity(
              viewModel.backgroundOpacity?.value ?? 0.8,
            ),
            darkPurple.withOpacity(
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
              'Chargement...',
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
