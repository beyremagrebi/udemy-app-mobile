import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final ThemeViewModel viewModel;

  const AppFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.paddingAllxSmall,
      child: InkWell(
        onTap: onTap,
        borderRadius: Dimensions.xsmallBorderRadius,
        child: Card(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: selected
                  ? viewModel.currentTheme.primary.withOpacity(0.4)
                  : Colors.transparent,
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: Dimensions.xsmallBorderRadius,
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
