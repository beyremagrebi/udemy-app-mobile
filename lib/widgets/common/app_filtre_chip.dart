import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Padding(
      padding: Dimensions.paddingAllxSmall,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: Dimensions.xsmallBorderRadius,
          child: Card(
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: selected
                    ? viewModel.currentTheme.secondary.withOpacity(0.6)
                    : Colors.transparent,
                border: Border.all(
                    color: Colors.white, width: selected ? 0.3 : 0.5),
                borderRadius: Dimensions.xsmallBorderRadius,
              ),
              child: Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Dimensions.widthxSmall,
                  if (selected)
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
