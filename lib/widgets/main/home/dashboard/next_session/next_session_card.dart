import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
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
          children: [
            IconBox(icon: iconData, iconBackgroundColor: iconColor),
            Dimensions.widthSmall,
            Column(
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
                Text(
                  '$teacher · $time',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    location,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12,
                    ),
                  ),
                  Dimensions.heightxSmall,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: Dimensions.mediumBorderRadius,
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
            ),
          ],
        ),
      ),
    );
  }
}
