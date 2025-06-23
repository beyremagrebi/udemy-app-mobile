import 'package:flutter/material.dart';

import '../../../core/styles/dimensions.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final int? notificationCount;

  const ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    super.key,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(Dimensions.l),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Dimensions.xl),
        border: Border.all(color: colorScheme.onSurface.withOpacity(0.1)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Dimensions.xxxl * 1.8,
                height: Dimensions.xxxl * 1.8,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(Dimensions.m),
                ),
                child: Icon(icon,
                    color: colorScheme.onPrimary, size: Dimensions.xxxl),
              ),
              const SizedBox(height: Dimensions.l),
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimensions.xs),
              Text(
                subtitle,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimary.withOpacity(0.7),
                ),
              ),
            ],
          ),
          if (notificationCount != null && notificationCount! > 0)
            Positioned(
              top: -Dimensions.s,
              right: -Dimensions.s,
              child: Container(
                padding: const EdgeInsets.all(Dimensions.xs),
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 22,
                  minHeight: 22,
                ),
                child: Text(
                  '$notificationCount',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
