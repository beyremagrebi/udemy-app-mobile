import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class VotreRangCard extends StatelessWidget {
  final int rank;
  final int total;
  final String positionText;
  final IconData trendIcon;
  final Color trendColor;

  const VotreRangCard({
    required this.rank,
    required this.total,
    required this.positionText,
    required this.trendIcon,
    required this.trendColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Général',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Text(
                  '$rank / $total',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  positionText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Expanded(child: Dimensions.widthSmall),
            Icon(trendIcon, color: trendColor, size: 32),
          ],
        ),
      ),
    );
  }
}
