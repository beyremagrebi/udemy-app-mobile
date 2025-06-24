import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final double iconSize;
  final TextStyle? textStyle;
  final Widget? trailing;

  const SectionHeader({
    required this.icon,
    required this.iconColor,
    required this.title,
    super.key,
    this.iconSize = 28,
    this.textStyle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: iconSize + 10,
              height: iconSize + 10,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.13),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: iconSize),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: textStyle ??
                  theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withOpacity(0.95),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
          ],
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
