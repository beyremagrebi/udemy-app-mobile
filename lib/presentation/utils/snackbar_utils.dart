import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SnackBarUtils {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.withOpacity(0.4),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    final viewModel = context.read<ThemeViewModel>();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: viewModel.currentTheme.secondary.withOpacity(0.4),
      ),
    );
  }
}
