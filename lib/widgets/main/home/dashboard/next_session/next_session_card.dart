import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class NextSessionCard extends StatelessWidget {
  final String title;
  final String teacher;
  final String time;
  final String location;
  final String type;

  const NextSessionCard({
    required this.title,
    required this.teacher,
    required this.time,
    required this.location,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isOnline = type == 'En Ligne';
    final iconData = title.toLowerCase().contains('math')
        ? Icons.menu_book
        : title.toLowerCase().contains('physique')
            ? Icons.laptop_mac
            : Icons.auto_stories;

    final iconColor = isOnline ? Colors.blueAccent : Colors.deepPurpleAccent;
    final badgeColor = isOnline ? Colors.blue : Colors.green;
    final badgeBg = isOnline
        ? Colors.blue.withOpacity(0.08)
        : Colors.green.withOpacity(0.08);

    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(iconData, color: Colors.white, size: 22),
            ),
            Dimensions.widthMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Dimensions.heightxSmall,
                  Text(
                    '$teacher · $time',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  location,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 12,
                  ),
                ),
                Dimensions.heightSmall,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: badgeColor.withOpacity(0.5)),
                  ),
                  child: Text(
                    type,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: badgeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
