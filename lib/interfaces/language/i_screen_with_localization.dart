import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main/profile/language/language_view_model.dart';

abstract class IScreenWithLocalization extends StatelessWidget {
  const IScreenWithLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    // Automatically watch for language changes
    final languageViewModel = context.watch<LanguageViewModel>();

    // Call the localized build method
    return buildLocalized(context, languageViewModel);
  }

  // Abstract method that implementing classes must override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  );
}
