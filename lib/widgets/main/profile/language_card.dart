import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

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
                    ? AppColors.primaryColor
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: currentLanguage
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: currentLanguage
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 13,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
