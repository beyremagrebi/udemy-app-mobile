import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main/profile/language/language_view_model.dart';

abstract class IScreenWithLocalization extends StatelessWidget {
  const IScreenWithLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    final languageViewModel = context.watch<LanguageViewModel>();
    return buildLocalized(context, languageViewModel);
  }

  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  );
}
