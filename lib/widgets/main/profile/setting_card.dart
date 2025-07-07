import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  final double size;
  final bool canNavigate;
  const SettingCard({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    this.canNavigate = true,
    super.key,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            IconBox(
              icon: icon,
              iconBackgroundColor: color,
              size: size,
            ),
            Dimensions.widthSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey.shade300, fontSize: 11),
                ),
              ],
            ),
            if (canNavigate) ...[
              const Expanded(child: Dimensions.widthSmall),
              const Icon(Icons.navigate_next)
            ]
          ],
        ),
      ),
    );
  }
}
