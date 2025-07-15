import 'dart:ui';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAlertDialog {
  static const Color darkPurple = Color(0xFF5B21B6);
  static const Color successColor = Color(0xFF10B981);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color textWhite = Colors.white;
  static const Color textGray = Color(0xFFB8B5C3);
  static Widget buildCustomDialog({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String primaryButtonText,
    required Color primaryButtonColor,
    String? secondaryButtonText,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
  }) {
    final themeViewModel = context.watch<ThemeViewModel>();

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 340),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF1E1B4B),
              themeViewModel.currentTheme.primary.withOpacity(0.9),
              themeViewModel.currentTheme.secondary.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icône
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: iconColor.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),

              // Titre
              Text(
                title,
                style: const TextStyle(
                  color: textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Message
              Text(
                message,
                style: const TextStyle(
                  color: textGray,
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Boutons
              if (secondaryButtonText != null) ...[
                // Deux boutons
                Row(
                  children: [
                    Expanded(
                      child: _buildDialogButton(
                        text: secondaryButtonText,
                        color: Colors.transparent,
                        textColor: textGray,
                        borderColor: Colors.white.withOpacity(0.3),
                        onPressed: onSecondaryPressed ??
                            () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDialogButton(
                        text: primaryButtonText,
                        color: primaryButtonColor,
                        textColor: textWhite,
                        borderColor: Colors.white.withOpacity(0.3),
                        onPressed: onPrimaryPressed ??
                            () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Un seul bouton
                SizedBox(
                  width: double.infinity,
                  child: _buildDialogButton(
                    text: primaryButtonText,
                    color: primaryButtonColor,
                    textColor: textWhite,
                    borderColor: Colors.white.withOpacity(0.3),
                    onPressed:
                        onPrimaryPressed ?? () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
    IconData icon = Icons.help_outline,
    Color iconColor = warningColor,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final themeViewModel = context.watch<ThemeViewModel>();

        return buildCustomDialog(
          context: context,
          icon: icon,
          iconColor: iconColor,
          title: title,
          message: message,
          primaryButtonText: confirmText,
          primaryButtonColor: themeViewModel.currentTheme.primary,
          secondaryButtonText: cancelText,
          onPrimaryPressed: () => Navigator.of(context).pop(true),
          onSecondaryPressed: () => Navigator.of(context).pop(false),
        );
      },
    );
  }

  static Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return buildCustomDialog(
          context: context,
          icon: Icons.error_outline,
          iconColor: errorColor,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: errorColor,
          onPrimaryPressed: onPressed ?? () => Navigator.of(context).pop(),
        );
      },
    );
  }

  static Future<void> showSuccessDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return buildCustomDialog(
          context: context,
          icon: Icons.check_circle_outline,
          iconColor: successColor,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: successColor,
          onPrimaryPressed: onPressed ?? () => Navigator.of(context).pop(),
        );
      },
    );
  }

  static Future<void> showWarningDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return buildCustomDialog(
          context: context,
          icon: Icons.warning_amber_outlined,
          iconColor: warningColor,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: warningColor,
          onPrimaryPressed: onPressed ?? () => Navigator.of(context).pop(),
        );
      },
    );
  }

  static Widget _buildDialogButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    Color? borderColor,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 44,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: Dimensions.smallBorderRadius,
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: Dimensions.smallBorderRadius,
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
