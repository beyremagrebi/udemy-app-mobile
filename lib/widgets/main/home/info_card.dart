import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/styles/dimensions.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackgroundColor;

  const InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.xl),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.12),
              Colors.white.withOpacity(0.06),
            ],
          ),
          borderRadius: BorderRadius.circular(Dimensions.xl),
          border: Border.all(
            color: Colors.white.withOpacity(0.18),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: Dimensions.xl,
              offset: const Offset(0, Dimensions.l),
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.xl,
              vertical: Dimensions.l,
            ),
            child: Row(
              children: [
                // Texts on the left
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.82),
                            fontWeight: FontWeight.w500,
                            fontSize: Dimensions.m + 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.s),
                      Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.xl,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: Dimensions.l),
                // Icon on the right
                Container(
                  width: Dimensions.xl,
                  height: Dimensions.xl,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(Dimensions.l),
                    boxShadow: [
                      BoxShadow(
                        color: iconBackgroundColor.withOpacity(0.18),
                        blurRadius: Dimensions.xl,
                        offset: const Offset(0, Dimensions.s),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: iconBackgroundColor,
                      size: Dimensions.xl, // Match value text size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
