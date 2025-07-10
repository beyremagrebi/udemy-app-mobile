import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/main/profile/theme/theme_view_model.dart';

class LanguageCard<T extends Enum> extends StatelessWidget {
  final T language;
  final bool currentLanguage;
  final String Function(T) getDisplayName;

  const LanguageCard({
    required this.language,
    required this.currentLanguage,
    required this.getDisplayName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            Expanded(child: Text(getDisplayName(language))),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: currentLanguage
                    ? viewModel.currentTheme.secondary
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: currentLanguage
                      ? Colors.transparent
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: currentLanguage
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
