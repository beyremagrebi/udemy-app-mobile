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
            if (currentLanguage)
              const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
