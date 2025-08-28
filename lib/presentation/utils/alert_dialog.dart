import 'dart:ui';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAlertDialog {
  static Future<void> build({
    required BuildContext context,
    required String title,
    required String primaryButtonText,
    String? message,
    Widget? content, // new content widget
    String? secondaryButtonText,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
  }) async {
    await showDialog<void>(
        context: context,
        builder: (context) {
          final themeViewModel = context.watch<ThemeViewModel>();
          return Material(
            color: Colors.transparent,
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Message or custom content
                    if (content != null) ...[
                      content,
                    ],

                    // Buttons
                    if (secondaryButtonText != null) ...[
                      Row(
                        children: [
                          Expanded(
                            child: _buildDialogButton(
                              text: secondaryButtonText,
                              color: Colors.transparent,
                              textColor: Colors.white70,
                              borderColor: Colors.white.withOpacity(0.3),
                              onPressed: onSecondaryPressed ??
                                  () => Navigator.of(context).pop(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildDialogButton(
                              text: primaryButtonText,
                              color: themeViewModel.currentTheme.secondary,
                              textColor: Colors.white,
                              borderColor: Colors.white.withOpacity(0.3),
                              onPressed: onPrimaryPressed ??
                                  () => Navigator.of(context).pop(),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      SizedBox(
                        width: double.infinity,
                        child: _buildDialogButton(
                          text: primaryButtonText,
                          color: themeViewModel.currentTheme.secondary,
                          textColor: Colors.white,
                          borderColor: Colors.white.withOpacity(0.3),
                          onPressed: onPrimaryPressed ??
                              () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
  }

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
                  color: Colors.white,
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
                  color: Colors.white70,
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
                        textColor: Colors.white70,
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
                        textColor: Colors.white,
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
                    textColor: Colors.white,
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
    Color iconColor = Colors.amber,
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
          iconColor: Colors.red,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: Colors.red,
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
          iconColor: Colors.green,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: Colors.green,
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
          iconColor: Colors.amber,
          title: title,
          message: message,
          primaryButtonText: buttonText,
          primaryButtonColor: Colors.amber,
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
