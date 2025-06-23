import 'package:flutter/material.dart';

import '../../../core/styles/dimensions.dart';

class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Using a fixed height for simplicity, but this could be calculated dynamically.
    const double headerHeight = 140;

    return Container(
      height: headerHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.l,
        vertical: Dimensions.xl,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        // Using a value that is a multiple of the dimension constants.
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(Dimensions.xxxl)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: Dimensions.xxxl + Dimensions.xs, // 24 + 4 = 28
            backgroundColor: colorScheme.onPrimary.withOpacity(0.15),
            child: Text('🎓',
                style: TextStyle(fontSize: textTheme.headlineMedium?.fontSize)),
          ),
          const SizedBox(width: Dimensions.l),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bonjour, Sarah 👋',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: Dimensions.xs),
                Text(
                  'Lycée Victor Hugo • Terminale S',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
